-- Unmap space
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next Diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic quickfix' })

-- Escape clears search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Window movement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Down window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Up window' })

-- Tab movement
vim.keymap.set('n', 'H', 'gT', { desc = 'Prev tab' })
vim.keymap.set('n', 'L', 'gt', { desc = 'Next tab' })

-- Swap <C-i>/<C-o>
vim.keymap.set('n', '<C-i>', '<C-o>')
vim.keymap.set('n', '<C-o>', '<C-i>')
