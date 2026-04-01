return {
  pack = {
    src = 'https://github.com/folke/flash.nvim',
  },
  setup = function()
    local flash = require 'flash'
    local map = vim.keymap.set

    flash.setup {
      modes = {
        char = { enabled = false },
      },
    }

    map({ 'n' }, 's', function()
      flash.jump()
    end, { desc = 'flash search' })

    map({ 'o' }, 'r', function()
      flash.remote()
    end, { desc = 'remote flash' })
  end,
}
