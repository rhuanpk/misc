#!/bin/bash

echo 'shows difference between special variables "${@}" and "${*}".'

echo -e $'\nloop for with: ${@}:'
for arg in ${@:?enter one or more parameters}; do
	sleep .1
	echo $arg
done

echo -e $'\nloop for with: ${*}:'
for arg in ${*}; do
	sleep .1
	echo $arg
done

echo -e $'\nloop for with: "${@}":'
for arg in "${@}"; do
	sleep .1
	echo $arg
done

echo -e $'\nloop for with: "${*}":'
for arg in "${*}"; do
	sleep .1
	echo $arg
done
