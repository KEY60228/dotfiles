# dotfiles

ref. [chezmoi](https://www.chezmoi.io/)

## setup

```sh
xcode-select --install
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply KEY60228
```

### for Mac

- Remap Caps Lock to Control via System Settings

## daily usage

```sh
chezmoi edit ~/.zshrc    # edit (opens the source file)
chezmoi diff             # preview changes
chezmoi apply            # apply changes
chezmoi cd               # jump to the source directory
```

Editing `.Brewfile` and running `chezmoi apply` changes the hash of `run_onchange_after_10-brew-bundle.sh`, which re-runs `brew bundle` automatically.
