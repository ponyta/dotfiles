# Dotfiles

## Install

```sh
sudo pacman -S zsh-autosuggestions zsh-autocomplete fzf
stow git zsh nvim vim tmux claude kitty
```

## Neovim

Leader key: `,`

| Key         | Action                         |
| ----------- | ------------------------------ |
| `<leader>t` | Find file                      |
| `<leader>f` | Live grep                      |
| `<leader>g` | LSP references                 |
| `<leader>d` | Toggle file tree (Neo-tree)    |
| `<leader>r` | Compile LaTeX (`.tex` files)   |
| `<leader>q` | Open diagnostics quickfix list |
| `C-h/j/k/l` | Navigate splits                |

LSPs: `lua_ls`, `ts_ls`, `pyright`. Formatting on save via conform.nvim (stylua, prettier).

## tmux

Prefix: `C-a`

| Key                 | Action                      |
| ------------------- | --------------------------- |
| `prefix + v`        | Split vertical              |
| `prefix + s`        | Split horizontal            |
| `prefix + h/j/k/l`  | Navigate panes              |
| `prefix + t/T`      | Next/previous window        |
| `prefix + c`        | New window                  |
| `prefix + [`        | Enter copy mode             |
| `prefix + ]`        | Paste                       |
| `v` (copy mode)     | Begin selection             |
| `Enter` (copy mode) | Copy to clipboard (wl-copy) |
| `prefix + R`        | Reload config               |
