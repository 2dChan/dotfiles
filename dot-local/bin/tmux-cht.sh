#!/bin/sh

LANGS="
bash
c
cpp
css
golang
gdb
haskell
html
javascript
lua
php
python
rust
solidity
tmux
typescript
v
vlang
zsh
"

COMMANDS="
awk
cat
cargo
chmod
chown
cp
docker
docker-compose
find
git
git-commit
git-rebase
git-status
git-worktree
grep
head
jq
kill
less
lsof
ls
make
man
mv
ps
rename
rg
rm
sed
ssh
stow
tail
tar
tldr
tr
xargs
"

selected=$(printf "%s\n%s\n" "$LANGS" "$COMMANDS" | fzf)
[ -z "$selected" ] && exit 0

printf "Enter Query: "
read query

# проверим, входит ли выбранное в LANGS
echo "$LANGS" | grep -qs "^$selected$"
if [ $? -eq 0 ]; then
    query=$(echo "$query" | tr ' ' '+')
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\"; curl cht.sh/$selected/$query; read -n1 -s"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less -R"
fi

