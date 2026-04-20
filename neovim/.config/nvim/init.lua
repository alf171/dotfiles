vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'settings'
require 'keymaps'
require 'qf'
require 'autocmds'

-- bootsrap vim.pack
local pack_loader = require('pack_loader')
local plugins = require('plugins')
pack_loader.setup(plugins)

vim.api.nvim_create_user_command('ReloadPlugins', function()
  vim.notify('Reloading all plugins...')
  pack_loader.reload_all(plugins)
end, {})
