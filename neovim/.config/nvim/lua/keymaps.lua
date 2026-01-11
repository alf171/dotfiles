local map = vim.keymap.set
-- Unmap space
map('n', '<Space>', '<Nop>', { noremap = true, silent = true })

-- Diagnostics
map('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev Diagnostic' })
map('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next Diagnostic' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic quickfix' })

-- Escape clears search
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Window movement
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Down window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Up window' })

-- Tab movement
map('n', 'H', 'gT', { desc = 'Prev tab' })
map('n', 'L', 'gt', { desc = 'Next tab' })

-- Swap <C-i>/<C-o>
map('n', '<C-i>', '<C-o>')
map('n', '<C-o>', '<C-i>')

-- TODO: evaluate using default or new binding here
-- gh, gl to go to start and end of line
map({ 'n', 'x' }, 'gh', '<Nop>', { noremap = true, silent = true })
map({ 'n', 'x' }, 'gh', '^')
map({ 'n', 'x' }, 'gl', '<Nop>', { noremap = true, silent = true })
map({ 'n', 'x' }, 'gl', '$')

-- disable s key since we will focus on flash using it
map('n', 's', '<Nop>')
map('n', 'S', '<Nop>')

-- Remap X
map('n', 'X', 'cc<Esc>')

-- Disable S in visual mode
map('x', 'S', '<Nop>', { silent = true })
-- TODO: compare with mini.splitjoin
-- Opposite of J (just break the line at cursor)
map('n', 'S', '"_cl<CR><Esc>', { desc = 'Split line at cursor' })

-- Remap gx since it conflicts with mini operators -- use gg instead (go does same thing)
map('n', 'gg', '<Nop>')
map('n', 'gg', '<Cmd>silent! execute "!open " . shellescape(expand("<cfile>"))<CR>', { desc = 'Open link under cursor' })

-- delete buffer
map('n', '<leader>db', function()
  require('mini.bufremove').delete(0, false)
end, { desc = 'Delete buffer' })

-- remap command mode to ;
-- map({ 'n', 'v', 'x' }, ';', ':', { desc = 'Self explanatory' })
-- map({ 'n', 'v', 'x' }, ':', ';', { desc = 'Self explanatory' })

-- page movement auto center
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
-- map('n', '<C-f>', '<C-f>zz')
-- map('n', '<C-b>', '<C-b>zz')

map('n', '<leader><leader>r', '<cmd>source %<CR>')

-- similar to K but in insert mode
map('i', '<C-a>', function()
  vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'Show signature help' })

-- Control j/k through built in neovim autocomplete
map('i', '<C-j>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  end
  return '<C-j>'
end, { expr = true, silent = true })
map('i', '<C-k>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  end
  return '<C-k>'
end, { expr = true, silent = true })
