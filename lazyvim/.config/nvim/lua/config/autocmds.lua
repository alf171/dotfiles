-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.keymap.set('i', '<C-j>', '<C-n>', { noremap = true, silent = true })
-- Map Ctrl+k to move up in completion menu (like Ctrl+p)
vim.keymap.set("i", "<C-k>", "<C-p>", { noremap = true, silent = true })

-- Map Tab to select completion item (like Enter)
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  else
    return "<Tab>"
  end
end, { noremap = true, expr = true, silent = true })
