return {
  'stevearc/oil.nvim',
  dependencies = {
    { 'nvim-mini/mini.icons', opts = {} },
  },
  lazy = false,
  opts = {
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
      -- ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      -- ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-v>'] = 'actions.preview',
      ['q'] = { 'actions.close', mode = 'n' },
      ['<C-l>'] = false,
      ['<C-r>'] = 'actions.refresh',
      -- ['_'] = { 'actions.open_cwd', mode = 'n' },
      -- ['`'] = { 'actions.cd', mode = 'n' },
      -- ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      -- ['gs'] = { 'actions.change_sort', mode = 'n' },
      -- ['gx'] = 'actions.open_external',
      -- ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      -- ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },
  },
  keys = function()
    local km = vim.keymap

    km.set('n', '<leader>e', function()
      require('oil').open_float(vim.fn.getcwd())
    end, { desc = 'open oil in project dir' })

    km.set('n', '<leader>c', function()
      require('oil').open_float()
    end, { desc = 'open oil in current dir' })
  end,
}
