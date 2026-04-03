return {
  pack = {
    src = 'https://github.com/nvim-mini/mini.cmdline',
  },
  setup = function()
    require('mini.cmdline').setup {
      autocomplete = {
        enable = true,
        delay = 300,
      },
    }

    vim.keymap.set('c', '<c-j>', '<c-n>')
    vim.keymap.set('c', '<c-k>', '<c-p>')
  end,
}
