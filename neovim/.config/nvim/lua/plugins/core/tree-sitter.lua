return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  -- TODO: move to main branch
  branch = 'master',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    -- Treesitter core
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'diff',
        'lua',
        'markdown',
        'query',
        'vim',
        'vimdoc',
        'typst',
        'json',
        'zig',
        'python',
        'tmux',
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      modules = {},
      highlight = {
        enable = true,
        disable = { 'tmux' },
      },
      indent = { enable = true },
      textobjects = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = false,
          node_incremental = 'an',
          node_decremental = 'in',
        },
      },
    }

    -- Treesitter context
    -- TODO: consider adding keymaps
    require('treesitter-context').setup {
      enable = true,
      max_lines = 3,
      line_numbers = true,
      trim_scope = 'outer',
      mode = 'cursor',
      zindex = 20,
    }
  end,
}
