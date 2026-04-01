return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    require('nvim-treesitter').setup()
    require('nvim-treesitter').install {
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
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash',
        'c',
        'cpp',
        'diff',
        'lua',
        'markdown',
        'query',
        'vim',
        'help',
        'typst',
        'json',
        'zig',
        'python',
      },
      callback = function(args)
        if vim.bo[args.buf].filetype ~= 'tmux' then
          vim.treesitter.start(args.buf)
        end
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'bash',
        'c',
        'cpp',
        'lua',
        'json',
        'zig',
        'python',
      },
      callback = function(args)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    require('nvim-treesitter-textobjects').setup {
      -- put actual textobject config here
      -- your old `textobjects = { enable = true }` is not enough on main
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
