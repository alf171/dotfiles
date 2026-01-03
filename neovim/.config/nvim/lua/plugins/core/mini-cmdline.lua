return {
  'nvim-mini/mini.cmdline',
  version = '*',
  config = function()
    require('mini.cmdline').setup {
      autocomplete = {
        enable = true,
        delay = 200,
      },
    }

    local map = vim.keymap.set
    map('c', '<c-j>', '<c-n>')
    map('c', '<c-k>', '<c-p>')
  end,
}
