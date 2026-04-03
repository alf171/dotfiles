return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = {
    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == 'c' or ft == 'cpp' then
        return nil
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'uncrustify' },
      cpp = { 'clang-format' },
      typst = { 'typstyle' },
      json = { 'jq' },
      zig = { 'zigfmt' },
    },
  },
}
