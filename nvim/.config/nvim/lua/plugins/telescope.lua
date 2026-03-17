return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension 'fzf'
        end,
      },
    },
    keys = {
      {
        '<leader>t',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find file',
      },
      {
        '<leader>f',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Codesearch',
      },
      {
        '<leader>g',
        function()
          require('telescope.builtin').lsp_references()
        end,
        desc = 'View references',
      },
    },
    opts = {
      pickers = {
        lsp_references = {
          theme = 'ivy',
        },
      },
    },
  },
}
