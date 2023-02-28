# git_rebase script!

## install

```bash
bash -c '{ sudo wget -qP /usr/local/bin/ "https://raw.githubusercontent.com/rhuanpk/temporary/master/git_rebase/git_rebase" && sudo chmod +x /usr/local/bin/git_rebase; } && { echo -e "script: every \e[1mok\e[m!"; newgrp ${USER:-$(whoami)}; } || echo -e "script: something \e[1mwrong\e[m!"'
```

## usage

simply type:

```bash
git_rebase
```
