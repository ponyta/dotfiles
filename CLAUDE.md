## Overview

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory (`git`, `jj`,
`nvim`, `vim`, `tmux`, `zsh`) is a stow package whose contents mirror the home directory structure.

## Applying dotfiles

Symlink all configs into `$HOME`:

```sh
stow git zsh nvim vim tmux jj
```

To apply a single package:

```sh
stow nvim
```

To remove symlinks for a package:

```sh
stow -D nvim
```

## Architecture

**Stow package layout**: Files inside each package directory are symlinked relative to `$HOME`. For example,
`nvim/.config/nvim/init.lua` becomes `~/.config/nvim/init.lua`.

**Neovim** (`nvim/.config/nvim/`):

- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim), configured in `lua/config/lazy.lua`
- LSPs enabled: `lua_ls`, `ts_ls`, `pyright` — configured in `lua/config/lsp.lua` and individual spec files under `lsp/`
- Formatting via conform.nvim: stylua (Lua), prettier (Markdown, JS) — auto-formats on save
- Plugins live under `lua/plugins/`; each file returns a lazy.nvim plugin spec
- Leader key is `,`

**tmux** (`tmux/.tmux.conf`):

- Prefix: `C-a`
- Copy uses `wl-copy` (Wayland clipboard)
- vi-mode keys; vim-style pane navigation

**JJ** (`jj/.config/jj/config.toml`):

- Uses [Jujutsu](https://github.com/jj-vcs/jj) VCS
- Custom aliases: `tug` (move nearest bookmark), `init` (wraps `jj git init`)
- Default command: `jj log`
