return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'typst',
      'json',
      'zig',
      'python',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {},
    },
    indent = { enable = true, disable = {} },
    textobjects = { enable = true },
  },
  -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  -- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
}
