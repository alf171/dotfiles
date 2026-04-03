return {
  pack = {
    src = 'http://github.com/stevearc/oil.nvim',
  },
  setup = function()
    local oil = require 'oil'
    oil.setup {
      float = {
        max_width = 0.75,
        max_height = 0.75,
        border = 'rounded',
      },
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<CR>'] = 'actions.select',
        ['<C-n>'] = 'actions.select',
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-p>'] = { 'actions.parent', mode = 'n' },
        ['<C-v>'] = 'actions.preview',
        ['q'] = { 'actions.close', mode = 'n' },
        ['<C-l>'] = false,
        ['<C-r>'] = 'actions.refresh',
      },
    }
    local map = vim.keymap.set

    map('n', '<leader>e', function()
      require('oil').open_float(vim.fn.getcwd())
    end, { desc = 'open oil in project dir' })

    map('n', '<leader>c', function()
      require('oil').open_float()
    end, { desc = 'open oil in current dir' })
  end,
}
