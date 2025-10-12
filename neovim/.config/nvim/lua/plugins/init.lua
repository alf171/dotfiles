return {
  -- core
  { import = 'plugins.lsp' },
  { import = 'plugins.blink' },
  { import = 'plugins.tree-sitter' },
  -- { import = 'plugins.neo-tree' },
  { import = 'plugins.gitsigns' },
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
  { import = 'plugins.autopairs' },
  { import = 'plugins.indent_line' },
  { import = 'plugins.conform' },
  { import = 'plugins.bufferline' },
  { import = 'plugins.lang.typst-preview' },
  'folke/todo-comments.nvim',

  -- experimental
  { import = 'plugins.fyler' },
  { import = 'plugins.undo-tree' },
  { import = 'plugins.marks' },
}
