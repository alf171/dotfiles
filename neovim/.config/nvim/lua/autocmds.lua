local custom_group = vim.api.nvim_create_augroup('custom_autocmds', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = custom_group,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Tmux specific stuff
vim.api.nvim_create_autocmd('BufEnter', {
  group = custom_group,
  callback = function()
    local base = vim.fn.expand '%:t'
    if base ~= '' then
      vim.fn.system { 'tmux', 'set-environment', '-g', 'NVIM_FILE', base }
    else
      vim.fn.system { 'tmux', 'set-environment', '-gu', 'NVIM_FILE' }
    end
  end,
})
