return {
  'nvim-mini/mini.tabline',
  version = '*',
  config = function()
    require('mini.tabline').setup {
      show_icons = true,
      format = nil,
      tabpage_section = 'left',
    }
    local map = vim.keymap.set
    map('n', '<leader>x', '<cmd>bd<CR>', { silent = true, desc = 'Close tab (buffer)' })
  end,
}
