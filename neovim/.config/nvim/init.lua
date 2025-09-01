vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'settings'
require 'keymaps'
require 'autocmds'

-- bootstrap lazy.nvim here
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- load plugin spec table from lua/plugins/init.lua
require('lazy').setup(require 'plugins')
