return {
  pack = {
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    },
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    },
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
    },
  },
  setup = function()
    local ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not ok then
      return
    end

    configs.setup {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'diff',
        'json',
        'lua',
        'markdown',
        'python',
        'query',
        'typst',
        'vim',
        'vimdoc',
        'zig',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
        },
        move = {
          enable = true,
        },
      },
    }

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
