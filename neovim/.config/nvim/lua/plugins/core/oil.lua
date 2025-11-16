return {
  'stevearc/oil.nvim',
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
  opts = {
    win_options = {
      winbar = "%{v:lua.require'oil'.get_current_dir()}",
    },
    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<CR>'] = 'actions.select',
      ['<C-l>'] = 'actions.select',
      -- ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      -- ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = { 'actions.close', mode = 'n' },
      ['<C-r>'] = 'actions.refresh',
      ['<C-h>'] = { 'actions.parent', mode = 'n' },
      -- ['_'] = { 'actions.open_cwd', mode = 'n' },
      -- ['`'] = { 'actions.cd', mode = 'n' },
      -- ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      -- ['gs'] = { 'actions.change_sort', mode = 'n' },
      -- ['gx'] = 'actions.open_external',
      -- ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      -- ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },
  },
}
