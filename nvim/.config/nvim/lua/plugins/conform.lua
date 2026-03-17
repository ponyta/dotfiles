return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters = {
        prettier_markdown = {
          command = 'prettier',
          args = {
            '--parser=markdown',
            '--prose-wrap',
            'always',
            '--print-width',
            '120',
          },
        },
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'prettier_markdown' },
        javascript = { 'prettier' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    },
  },
}
