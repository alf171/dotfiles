-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- Unmap the keys first (no-ops)
vim.keymap.set("i", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Nop>", { noremap = true, silent = true })
-- Don't unmap Tab as we're providing alternative functionality

-- Map Ctrl+j to move down in completion menu (like Ctrl+n)
vim.keymap.set("i", "<C-j>", "<C-n>", { noremap = true, silent = true })

-- Map Ctrl+k to move up in completion menu (like Ctrl+p)
vim.keymap.set("i", "<C-k>", "<C-p>", { noremap = true, silent = true })

-- Map Tab to select completion item (like Enter)
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  else
    return "<Tab>"
  end
end, { expr = true, noremap = true, silent = true })
