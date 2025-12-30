return {
  -- core
  { import = 'plugins.core.lsp' },
  { import = 'plugins.core.blink' },
  { import = 'plugins.core.tree-sitter' },
  { import = 'plugins.core.gitsigns' },
  { import = 'plugins.core.fzf' },
  { import = 'plugins.core.theme' },
  { import = 'plugins.core.oil' },
  { import = 'plugins.core.mini-tabline' },

  -- motions
  { import = 'plugins.motions.mini' },
  { import = 'plugins.motions.flash' },

  -- misc
  { import = 'plugins.misc.tmux' },
  { import = 'plugins.misc.wakatime' },
  { import = 'plugins.misc.todo-comments' },
  { import = 'plugins.misc.fileline' },

  -- fancy
  { import = 'plugins.fancy.fugitive' },
  { import = 'plugins.fancy.autopairs' },
  { import = 'plugins.fancy.indent_line' },
  { import = 'plugins.fancy.conform' },
  { import = 'plugins.lang.typst-preview' },

  -- experimental
  { import = 'plugins.experimental.undo-tree' },
  { import = 'plugins.experimental.marks' },

  -- handmade
  { import = 'plugins.handmade.quill' },
}
