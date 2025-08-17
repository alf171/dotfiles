return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree toggle left<CR>', desc = 'Toggle Explorer on and off', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['j'] = 'move_cursor_down',
          ['k'] = 'move_cursor_up',
          ['h'] = 'close_node',
          ['l'] = 'open',
        },
      },
    },
  },
}
