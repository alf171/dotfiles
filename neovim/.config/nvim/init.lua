vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'settings'
require 'keymaps'
require 'qf'
require 'autocmds'

-- bootsrap vim.pack
require('pack_loader').setup(require 'plugins')
