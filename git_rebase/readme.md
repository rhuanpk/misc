# git_rebase script!

## install

```bash
bash -c 'sudo wget -qP /usr/local/bin/ "https://raw.githubusercontent.com/rhuan-pk/temporary/master/git_rebase/git_rebase" && sudo chmod -v +x /usr/local/bin/git_rebase && echo -e "script: every \e[1mok\e[m!" || echo -e "script: something \e[1mwrong\e[m!"; newgrp ${USER:-$(whoami)}'
```

## usage

simply type:

```bash
git_rebase
```