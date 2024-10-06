########## for new commands ##########
zstyle ":completion:*:commands" rehash 1

########## for zsh-completions & zsh-autosuggestions ##########
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    autoload -Uz compinit && compinit
fi

########## for git ##########
### git-prompt
source ~/.zsh/git-prompt.sh

### git-completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

### git-flow-completion
source ~/.zsh/git-flow-completion.zsh

### prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

########## for anyenv ##########
if [ -e "$HOME/.anyenv" ]
then
    eval "$(anyenv init -)"
fi

########## for golang ##########
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:${PATH}"

########## for kubectl ##########
if type kubectl &>/dev/null; then
    source <(kubectl completion zsh)
fi

########## for helm ##########
if type helm &>/dev/null; then
    source <(helm completion zsh)
fi

########## for google-cloud-sdk ##########
### The next line updates PATH for the Google Cloud SDK.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]; then
    . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi

### The next line enables shell command completion for gcloud.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
    . "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

### The next line enables gke-gcloud-auth-plugin for kubectl
if [ -f "$(brew --prefix)/share/google-cloud-sdk/bin/gke-gcloud-auth-plugin" ]; then
    export USE_GKE_GCLOUD_AUTH_PLUGIN=true
fi

########## for psql ##########
if [ -e "$(brew --prefix)/opt/libpq/bin" ]; then
    export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"
fi
