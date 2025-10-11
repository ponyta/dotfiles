-- Set ',' as the leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'

require 'config.lazy'
require 'config.lsp'

vim.cmd.colorscheme 'catppuccin-mocha'
