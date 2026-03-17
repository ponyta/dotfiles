return {
  'lervag/vimtex',
  lazy = false,
  ft = { 'tex', 'latex', 'bib' },
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
  end,
  keys = {
    { '<leader>r', '<cmd>VimtexCompile<cr>', desc = 'Compile LaTeX and view PDF', ft = 'tex' },
  },
}
