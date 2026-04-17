# Install

## Common dependencies

### Arch
```sh
sudo pacman -S zsh-autosuggestions fzf
yay -S zsh-theme-powerlevel10k ttf-meslo-nerd
stow git zsh nvim vim tmux jj kitty
```

### Debian
```sh
apt install git zsh tmux vim neovim kitty
apt install zsh zsh-autosuggestions fzf
# Install powerlevel10k manually:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# Install jj from prebuilt binary or: cargo install jj-cli
# Install MesloLGS Nerd Font manually into ~/.local/share/fonts/
stow git zsh nvim vim tmux jj kitty
```

## vim

Install [vim-plug](https://github.com/junegunn/vim-plug):

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

## zsh

Prompt via Powerlevel10k with instant prompt (async). Segments: directory, jj status, exit status, execution time, time.

- `zsh-autosuggestions` for fish-like inline suggestions
- `fzf` for Ctrl+R history search and Ctrl+T file search
- Custom jj segment shows change ID, bookmarks, and conflict/divergent/empty flags

## tmux

Prefix: `C-a`. Status bar styled with Rosé Pine colors.

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
