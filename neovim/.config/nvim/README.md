# neovim config

Currently using Nvim 0.12.dev

I try to lean on the side of a minimal config.

## Plugin layout
lua/plugins/init.lua
  - where all plugins are imported
lua/plugins/core/
  - core plugins which provide basic functionality
  - plugins for search, highlighting, lsp, etc
lua/plugins/experimental/
  - new plugins which i am testing around with
lua/plugins/fancy/
  - plugins which provide value every now and then
lua/plugins/handmade/
  - plugins i wrote myself
lua/plugins/lang/
  - language specific plugins
lua/plugins/misc/
  - misc plugins
lua/plugins/motions/
  - plugins which extend vim's motions
