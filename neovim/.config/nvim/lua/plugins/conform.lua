return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = {
    format_on_save = function()
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      typst = { 'typstyle' },
    },
    formatters = {
      ['clang-format'] = {
        prepend_args = {
          '--style={BasedOnStyle: LLVM, IndentWidth: 2, TabWidth: 2, UseTab: Never, IndentCaseLabels: true}',
        },
      },
    },
  },
}
