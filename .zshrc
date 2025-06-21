########## for new commands ##########
zstyle ":completion:*:commands" rehash 1

########## for zsh-completions & zsh-autosuggestions ##########
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

########## for git ##########
### git-prompt
source ~/.zsh/git-prompt.sh

### git-completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

### prompt options
setopt PROMPT_SUBST; PS1='%F{cyan}%~%f %F{green}$(__git_ps1 "git: (\033[33m%s\033[0m\033[32m)")%f
%% '

########## for tmux pane title ##########
if [[ -n "$TMUX" ]]; then
    preexec() {
        printf "\033]2;%s\033\\" "$1"
    }
    precmd() {
        printf "\033]2;%s\033\\" "zsh"
    }
fi

########## for fzf ##########
if [ -e "$(brew --prefix)/opt/fzf" ]; then
    source <(fzf --zsh)
fi

########## for history ##########
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store

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

########## for proto ##########
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

########## for direnv ##########
if [ -e "$(brew --prefix)/opt/direnv" ]; then
    eval "$(direnv hook zsh)"
fi

########## for mysql ##########
if [ -e "$(brew --prefix)/opt/mysql-client" ]; then
    export PATH="$(brew --prefix)/opt/mysql-client/bin:$PATH"
fi
