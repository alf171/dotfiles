return {
  -- core
  { import = 'plugins.lsp' },
  { import = 'plugins.blink' },
  { import = 'plugins.tree-sitter' },
  { import = 'plugins.neo-tree' },
  { import = 'plugins.telescope' },
  { import = 'plugins.theme' },
  { import = 'plugins.wakatime' },

  -- motions
  { import = 'plugins.mini' },
  { import = 'plugins.flash' },

  -- misc
  { import = 'plugins.tmux' },

  -- fancy
  { import = 'plugins.fugitive' },
  { import = 'plugins.harpoon' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.lint' },
  { import = 'plugins.indent_line' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.conform' },
  { import = 'plugins.tabs' },
  'folke/todo-comments.nvim',
}
