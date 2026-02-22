package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"net"
	"os"
	"regexp"
	"strconv"
	"strings"
	"sync"

	"github.com/go-hl/normalize"
)

var mu sync.Mutex

func close(conn net.Conn) {
	log.Println(conn.RemoteAddr(), "disconnected")
	conn.Write([]byte("> disconnected\n"))
	conn.Close()
}

func title() []byte {
	const (
		msg       = "Sistema de Chamada Offline"
		msgLen    = len(msg)
		msgHalf   = msgLen / 2
		msgSub    = msgLen + (msgHalf / 2)
		msgPart   = msgLen + msgHalf
		msgDouble = msgLen * 2
	)

	var title string
	title += strings.Repeat("#", msgPart) + "\n"
	title += fmt.Sprintf("%*s\n", msgSub, msg)
	title += strings.Repeat("#", msgPart) + "\n"

	return []byte(title)
}

func menu() []byte {
	var menu string
	menu += "1. Presença\n"
	menu += "0. Sair\n"
	menu += "Opção: "

	return []byte(menu)
}

func option(conn net.Conn, file *os.File, reader *bufio.Reader, input string, option int) {
	mu.Lock()
	defer mu.Unlock()

	switch option {
	case 1:
		conn.Write([]byte("Nome: "))
		input, err := reader.ReadString('\n')
		if err != nil {
			log.Println(conn.RemoteAddr(), "error reading input:", err)
			conn.Write([]byte("> error reading input\n"))
			break
		}
		input = strings.TrimRight(input, "\r\n")

		if _, err := file.Seek(0, io.SeekStart); err != nil {
			log.Println(conn.RemoteAddr(), "error seeking file:", err)
			conn.Write([]byte("> internal server error\n"))
			close(conn)
			break
		}

		bytes, err := io.ReadAll(file)
		if err != nil {
			log.Println(conn.RemoteAddr(), "error reading file:", err)
			conn.Write([]byte("> internal server error\n"))
			close(conn)
			break
		}

		name := normalize.String(input)
		if regexp.MustCompile(fmt.Sprintf(`(?m)^%s$`, name)).Match(bytes) {
			log.Println(conn.RemoteAddr(), "name already present:", name)
			conn.Write([]byte("> name already present\n"))
			close(conn)
			break
		}

		if _, err := file.WriteString(name + "\n"); err != nil {
			log.Println(conn.RemoteAddr(), "error recording rollcall:", err)
			conn.Write([]byte("> error recording rollcall\n"))
			break
		}

		log.Println(conn.RemoteAddr(), "success recording rollcall:", name)
		conn.Write([]byte("> success recording rollcall\n"))

		close(conn)
	case 0:
		close(conn)
	default:
		log.Println(conn.RemoteAddr(), "unknow option:", input)
		conn.Write([]byte("> unknow option\n"))
	}
}

func rollcall(conn net.Conn, file *os.File) {
	defer conn.Close()

	reader := bufio.NewReader(conn)

	conn.Write(title())
	for {
		if _, err := conn.Read([]byte{}); err != nil {
			if !strings.Contains(err.Error(), "closed network connection") {
				log.Println("error read conn:", err)
			}
			break
		}

		conn.Write(menu())

		input, err := reader.ReadString('\n')
		if err != nil {
			log.Println(conn.RemoteAddr(), "error reading input:", err)
			conn.Write([]byte("> error reading input\n"))
			continue
		}
		input = strings.TrimRight(input, "\r\n")

		opt, err := strconv.Atoi(input)
		if err != nil {
			log.Println(conn.RemoteAddr(), "error parsing input:", err)
			conn.Write([]byte("> error parsing input\n"))
			continue
		}

		option(conn, file, reader, input, opt)
	}
}
