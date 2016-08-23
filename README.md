# emacs-config
my emacs config

# Install
## Windows

In Win10 system emacs's home at `%USERPROFILE%\AppData\Roaming\.emacs.d`, so download at this path.

# Keyboard

## Basic

- `C-x ?`: Show `C-x` keyboard bind table
- `C-c ?`: Show `C-c` keybaord bind table

## Custom

- `C-o` : Create a new line after current.
- `C-S-o` : Create a new line before current.

## Company

- `M-p` : Select next item
- `M-p` : Select preview item
- `C-s` | `C-r` | `C-o` : Search throught completions
- `M-digital` : Quickly complete with one of the first 10 candidates.
- `M-x company-complete` : Initailize completion manually.
- `<F1>` : When the completion candidates are shown, press this to display
the documentation for the selected candidate.
- `C-w` : to see selected candidate source

## Jedi

- `C-c .` :  Goto definition.
- `C-c ,` : Go back.
- `C-c d` : Show Doc.
- `<C-tab>` : complete.

# Plugins

## Jedi

1. install jedi, use `pip install jedi`.
2. install epc, use `pip install epc`.
3. install virtualenv, use `pip install virtualenv`.
4. `M-:jedi:install-server`


# Notes:
1. `set-buffer-file-coding-system`: change open file coding
