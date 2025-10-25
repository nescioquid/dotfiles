# BASH_ALIASES

alias src='source ~/.bashrc && echo "hey, you sourced .bashrc, yay!"'
alias what='alias'

# short forms
# alias gl='glog'
# alias gla='gloga'
# alias gld='glogd'
# alias gll='glogg'
# alias glm='glogm'
# alias glo='glogo'
# alias glp='glogp'
# alias glt='glogt'
# alias gs='gsw'
# alias gsc='gswc'
# alias gsd='gswd'
# alias gsl='gswl'
# alias gsm='gswm'
# alias gst='gswt'
# alias gun='gunwip'

# ---

# oh-my-zsh things

# cd ..
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# ls
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias lsa='ls -lah'

# vscode
alias vsc='code .'
alias vscn='code --new-window'
alias vscr='code --reuse-window'

# git

# sets the assumed names for the primary and development branches in repos
DEV='dev'
TRUNK='main'

# cherry-picks from the main and dev branches
alias gcpd='git cherry-pick ${DEV}'
alias gcpm='git cherry-pick ${TRUNK}'

# logs the main and dev branches
alias glogd='glog ${DEV}'
alias glogm='glog ${TRUNK}'

# rebases the current branch onto the main and dev branches
alias grbd='git rebase ${DEV}'
alias grbm='git rebase ${TRUNK}'

# switches to the main and dev branches
alias gswd='git switch ${DEV}'
alias gswm='git switch ${TRUNK}'

# ---

# temporary branch functionality
# these features allow you to manage a branch 'temp' that you can use to store temporary changes to your code

# creates a new branch 'temp'
alias gbct='git switch --create temp'
alias gbnt='git switch --create temp'

# deletes branch 'temp'
alias gbdt='git branch -df temp'
alias gtempd='git branch -df temp'
alias guntemp='git branch -df temp'

# logs branch 'temp'
alias glogt='glog temp'

# switches to branch 'temp'
alias gswt='git switch temp'

# automatically deletes any previous branch 'temp' and creates new a one
alias gtemp='gtemp() { if git rev-parse --quiet --verify temp; then git branch -df temp; git switch --create temp; git switch -; else git switch --create temp; git switch -; fi }; gtemp'

# same as 'gtemp', but leaves you in the branch 'temp'
alias gtempc='gtempc() { if git rev-parse --quiet --verify temp; then git branch -df temp; git switch --create temp; else git switch --create temp; fi }; gtempc'
alias gtempn='gtempn() { if git rev-parse --quiet --verify temp; then git branch -df temp; git switch --create temp; else git switch --create temp; fi }; gtempn'

# rebases the current branch onto the branch 'temp'
alias grbt='git rebase temp'

# cherry-picks from the branch 'temp'
alias gcpt='gcp temp'

# ---------->8----------CHEATSHEET BELOW HERE----------8<----------

# git

alias g='git'

# local and remote branches at origin management

# creates an upstream branch at origin associated with the current local branch
# pass in the name of the new origin branch
# (you probably want the same name as the current local branch)
alias gsetup='git push -v --set-upstream origin'

# associates a local branch with an already existing upstream branch at origin
# pass in the name of an already existing upstrean branch at origin
# (you probably want the same name as the current local branch)
alias gset='gset() { git branch --set-upstream-to=origin/"$1"; }; gset'

# unsets the association between the current local branch and its upstream branch
alias gunset='git branch --unset-upstream && echo hey, it looks like you unset that upstream branch'

# ---

# temporary branches
# these features allow you to manage a branch 'temp' that you can use to store temporary changes to your code,
# like when testing out two versions of a feature, or when cherry-picking

# automatically deletes any existing 'temp' branch and creates new a one from the current branch
alias gtemp='gtemp() { if git rev-parse --quiet --verify temp; then git branch -df temp; git switch --create temp; git switch -; else git switch --create temp; git switch -; fi }; gtemp'

# deletes 'temp' branch 
alias guntemp='git branch -df temp'

# ---

# oh-my-zsh's work in progress (wip)
# these features allow you to pause developing one branch and switch to another one ('Work in Progress', or 'wip')
# when you want to go back to work, just 'unwip' it

# makes wip commit
alias gwip='gwip() { git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"; }; gwip'

# undoes wip commit
alias gunwip='gunwip() { git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1; }; gunwip'

# ---

# utility aliases
# adds features for common workflows, some assumed but not directly provided by git itself

# a way to get to the manual pages for whatever git things you're learning about
# instead of running `man git-branch` for instance, now you can run `ghelp branch`
alias ghelp='ghelp() { man git-"$1"; }; ghelp'

# renames a git branch
alias grename='git branch --move'

# creates a new branch
alias gcreate='git switch --create'
alias gbc='git switch --create'
alias gbn='git switch --create'

# clears out the working tree entirely, except for already staged (added) changes
alias gclear='git restore . && git clean -df'

# uncommits one or more commits, leaving their changes in the working tree
# defaults to one commit, pass in a number to undo more than one
alias gback='gback() { git reset --mixed HEAD~"$1"; }; gback'

# diffs a given commit with the commit just before it
# defaults to the commit where the HEAD is pointing
# pass in the hash of the commit you want to see the diff of
alias gdd='gdd() { if [ $1 ]; then git diff "$1"~1 "$1"; else git diff HEAD~1 HEAD; fi }; gdd'

# logs a branch at origin
alias glogo='glogo() { git log --oneline --decorate --graph origin/"$1"; }; glogo'

# clears out the working tree entirely, including already staged (added) changes
alias gwipe='git reset --hard && git clean --force -df'

# switches to the last branch that you were on
alias glast='git switch -'
alias gswl='git switch -'

# ---

# short forms
# verbose flags (-v, -vv, --verbose) are added if possible

# add
alias ga='git add -v'
alias gaa='git add -v --all'

# bisect
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsn='git bisect new'
alias gbso='git bisect old'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

# branch
alias gb='git branch -vv'
alias gba='git branch -vv --all'
alias gbm='git branch --move'

# checkout
alias gco='git checkout'

# cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# commit
alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gcm='git commit -v --message'
alias gcam='git commit -v --all --message'

# config
alias gcf='git config --list'
alias gcfg='git config --list --global'

# diff
alias gd='git diff'
alias gds='git diff --staged'

# fetch
alias gf='git fetch'

# log
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glogg='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --stat'
alias glogp='git log --stat --patch'

# merge
alias gm='git merge -v'
alias gma='git merge --abort'

# pull
alias gpll='git pull -v'

# push
alias gpsh='git push -v'

# rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# remote
alias gr='git remote -v'
alias gra='git remote add'

# reset
alias grst='git reset'

# restore
alias grstr='git restore'

# status
alias gstat='git status'

# switch
alias gsw='git switch'
alias gswc='git switch --create'
