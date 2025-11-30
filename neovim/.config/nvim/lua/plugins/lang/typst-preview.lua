return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = 'v0.*',
  config = function()
    require('typst-preview').setup {
      auto_open = true,
      open_cmd = 'open %s',
    }
    local km = vim.keymap
    km.set('n', '<leader>tp', '<cmd>TypstPreview<cr>', { desc = 'Typst: Preview start' })
    km.set('n', '<leader>tP', '<cmd>TypstPreviewStop<cr>', { desc = 'Typst: Preview stop' })
    km.set('n', '<leader>tr', '<cmd>TypstPreviewRefresh<cr>', { desc = 'Typst: Preview refresh' })
  end,
}
