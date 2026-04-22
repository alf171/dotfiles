local map = vim.keymap.set
-- Unmap space
map('n', '<Space>', '<Nop>', { noremap = true, silent = true })

-- Diagnostics
map('n', '<leader>q', function()
  vim.diagnostic.setloclist { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Diagnostic quickfix' })

-- Escape clears search
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Simplify forward and backward searching
local function search_keys(forward, backwards)
  return function()
    return ({ backwards, forward })[vim.v.searchforward + 1]
  end
end
map('n', 'n', search_keys('n', 'N'), { expr = true })
map('n', 'N', search_keys('N', 'n'), { expr = true })

-- Window movement
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Down window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Up window' })

-- Tab movement
map('n', 'H', 'gT', { desc = 'Prev tab' })
map('n', 'L', 'gt', { desc = 'Next tab' })

for i = 1, 9 do
  map({'n', 'x'}, '<leader>' .. i, function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if bufs[i] then
      vim.api.nvim_set_current_buf(bufs[i].bufnr)
    end
  end, { desc = "go to buffer " .. i })
end

-- Swap <C-i>/<C-o>
map('n', '<C-i>', '<C-o>')
map('n', '<C-o>', '<C-i>')

-- TODO: evaluate using default or new binding here
-- gh, gl to go to start and end of line
map({ 'n', 'x' }, 'gh', '<Nop>', { noremap = true, silent = true })
map({ 'n', 'x' }, 'gh', '^')
map({ 'n', 'x' }, 'gl', '<Nop>', { noremap = true, silent = true })
-- $ has EOL semantics for {j, gj, k, gk} so going to last char to avoid this
map({ 'n', 'x' }, 'gl', 'g_')


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

-- remap command mode to ;
-- map({ 'n', 'v', 'x' }, ';', ':', { desc = 'Self explanatory' })
-- map({ 'n', 'v', 'x' }, ':', ';', { desc = 'Self explanatory' })

-- page movement auto center
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
-- map('n', '<C-f>', '<C-f>zz')
-- map('n', '<C-b>', '<C-b>zz')

map('n', '<leader><leader>r', '<cmd>source %<CR>')

-- move to alternate buffer
map('n', '<leader>a', ':edit #<CR>')

-- (il, al) text-objects => (inside line, all lines)
-- copied from: https://github.com/justinmk/config/blob/1a7c39e31692cf61444cc75a0371358aff978048/.config/nvim/lua/my/keymaps.lua#L89
local function entire_buffer_textobj()
  if vim.fn.empty(vim.fn.getline(1)) == 1 and vim.fn.line('$') == 1 then
    return '<Esc>'
  end

  vim.fn.setpos("'[", { 0, 1, 1, 0 })
  vim.fn.setpos("']", { 0, vim.fn.line('$'), 1, 0 })
  return "'[o']"
end

local function line_inner_movement()
  if vim.fn.empty(vim.fn.getline('.')) == 1 then
    return '<Esc>'
  end

  local lnum = vim.fn.line('.')
  local copen = 1
  local cclose = vim.fn.col('$') - 1

  vim.fn.setpos("'[", { 0, lnum, copen, 0 })
  vim.fn.setpos("']", { 0, lnum, cclose, 0 })

  return "`[o`]"
end

map('x', 'al', entire_buffer_textobj, { expr = true })
map('o', 'al', ':<C-U>normal Val<CR>', { silent = true })
map('x', 'il', line_inner_movement, { expr = true })
map('o', 'il', ':<C-U>normal vil<CR>', { silent = true })
