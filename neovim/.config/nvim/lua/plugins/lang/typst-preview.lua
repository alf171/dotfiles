return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = 'v0.*',
  config = function()
    require('typst-preview').setup {
      auto_open = true,
      open_cmd = 'open %s',
    }
    vim.keymap.set('n', '<leader>tp', '<cmd>TypstPreview<cr>', { desc = 'Typst: Preview start' })
    vim.keymap.set('n', '<leader>tP', '<cmd>TypstPreviewStop<cr>', { desc = 'Typst: Preview stop' })
    vim.keymap.set('n', '<leader>tr', '<cmd>TypstPreviewRefresh<cr>', { desc = 'Typst: Preview refresh' })
  end,
}
