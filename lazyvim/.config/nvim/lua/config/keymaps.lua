local opts = { noremap = true, silent = true }

-- Leader + w + Ctrl-direction splits
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "<leader>w<C-h>", ":leftabove vsplit<CR>", opts)
vim.keymap.set("n", "<leader>w<C-l>", ":rightbelow vsplit<CR>", opts)
vim.keymap.set("n", "<leader>w<C-k>", ":leftabove split<CR>", opts)
vim.keymap.set("n", "<leader>w<C-j>", ":rightbelow split<CR>", opts)
-- Leader + w + Cap-direction adjust size
vim.keymap.set("n", "<leader>wH", ":vertical resize -5<CR>", opts)
vim.keymap.set("n", "<leader>wL", ":vertical resize +5<CR>", opts)
vim.keymap.set("n", "<leader>wJ", ":resize -5<CR>", opts)
vim.keymap.set("n", "<leader>wK", ":resize +5<CR>", opts)

-- B to goto Def
vim.keymap.set("n", "<C-b>", "<Nop>", opts)
vim.keymap.set("n", "<C-b>", function()
    vim.lsp.buf.definition()
end, { desc = "Go to def" })
