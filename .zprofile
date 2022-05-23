## architecture check
if [ `uname -m` = "arm64" ]; then
    ## M1の場合homebrewのパスを通す
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ## zsh-completions用に権限変更
    chmod -R go-w /opt/homebrew/share
fi

if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

if [ -f ~/.aliases.zsh ]; then
    . ~/.aliases.zsh
fi
