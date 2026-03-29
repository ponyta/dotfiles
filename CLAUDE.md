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
- Status bar styled with Rosé Pine hex colors (overlay bg `#26233a`, foam active window `#9ccfd8`, iris time `#c4a7e7`)
- Extended keys enabled (`extended-keys on`) for Shift+Enter passthrough from kitty

**zsh** (`zsh/.zshrc`, `zsh/.p10k.zsh`):

- Prompt: Powerlevel10k with instant prompt (async rendering)
- Custom `prompt_jj` segment in `.p10k.zsh` shows jj change ID, bookmarks, and flags (conflict/divergent/empty)
- Plugins: `zsh-autosuggestions` (fish-like inline suggestions), `fzf` (history/file search)
- Powerlevel10k sourced from `/usr/share/zsh-theme-powerlevel10k/` (Arch); on Debian clone manually to `~/powerlevel10k/`

**kitty** (`kitty/.config/kitty/kitty.conf`):

- Theme: Rosé Pine (via `current-theme.conf`)
- `map shift+enter send_text all \x1b[13;2u` enables Shift+Enter passthrough to tmux

**JJ** (`jj/.config/jj/config.toml`):

- Uses [Jujutsu](https://github.com/jj-vcs/jj) VCS
- Custom aliases: `tug` (move nearest bookmark), `init` (wraps `jj git init`)
- Default command: `jj log`
