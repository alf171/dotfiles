return {
  -- core
  { import = 'plugins.lsp' },
  { import = 'plugins.blink' },
  { import = 'plugins.neo-tree' },
  { import = 'plugins.telescope' },
  { import = 'plugins.theme' },
  { import = 'plugins.wakatime' },

  -- motions
  { import = 'plugins.replace' },
  { import = 'plugins.surround' },

  -- fancy
  { import = 'plugins.harpoon' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.lint' },
  { import = 'plugins.indent_line' },
  -- { import = 'plugins.gitsigns' },
  { import = 'plugins.conform' },
  'folke/todo-comments.nvim',
}
