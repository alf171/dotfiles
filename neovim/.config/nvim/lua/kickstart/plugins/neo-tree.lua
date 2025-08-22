return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    { 'nvim-tree/nvim-web-devicons', opts = {} },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, position = 'left' }
      end,
      desc = 'Toggle Explorer on and off',
      silent = true,
    },
  },
  opts = function(_, opts)
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = vim.tbl_deep_extend('force', opts.filesystem.filtered_items or {}, {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {},
      hide_by_pattern = {},
      never_show = {},
      never_show_by_pattern = {},
    })

    -- Auto-refresh on disk changes
    opts.filesystem.use_libuv_file_watcher = true

    -- keep the tree synced to the current buffer
    opts.follow_current_file = { enabled = true }

    opts.filesystem.window = vim.tbl_deep_extend('force', opts.filesystem.window or {}, {
      mappings = {
        h = 'close_node',
        l = 'open',
      },
    })
    return opts
  end,
}
