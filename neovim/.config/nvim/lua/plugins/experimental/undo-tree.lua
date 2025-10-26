-- neovim introduces native undo trees with :Undotree
-- https://github.com/neovim/neovim/commit/9e1d3f4870705aec340b55d7767884ab64a4acf4
-- change is not stable yet
-- not sure if feature complete yet either
return {
  'mbbill/undotree',
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle UndoTree' },
  },
  config = function()
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.stdpath 'data' .. '/undo'
  end,
}
