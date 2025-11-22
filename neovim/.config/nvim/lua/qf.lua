local map = vim.keymap.set
local qf_group = vim.api.nvim_create_augroup('custom_qf', { clear = true })

-- go forward and backwards in qflist
map('n', '<C-n>', '<cmd>cnext<CR>', { desc = 'Quickfix next' })
map('n', '<C-p>', '<cmd>cprev<CR>', { desc = 'Quickfix prev' })

local del_qf_item = function()
  local items = vim.fn.getqflist()
  local line = vim.fn.line '.'
  table.remove(items, line)
  vim.fn.setqflist(items, 'r')
  vim.api.nvim_win_set_cursor(0, { line, 0 })
end

-- in qflist, dont conflict with dd
vim.api.nvim_create_autocmd('FileType', {
  group = qf_group,
  pattern = 'qf',
  callback = function()
    -- do not show qf in buff list
    vim.api.nvim_set_option_value('buflisted', false, { buf = 0 })

    -- escape closed qf list
    map('n', 'q', '<cmd>cclose<CR>', {
      buffer = true,
      noremap = true,
      silent = true,
    })

    -- remove item from qf list
    map('n', 'dd', del_qf_item, {
      buffer = true,
      noremap = true,
      silent = true,
      nowait = true,
    })
  end,
})
