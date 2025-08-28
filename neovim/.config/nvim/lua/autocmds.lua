-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Tmux specific stuff
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local base = vim.fn.expand '%:t'
    if base ~= '' then
      vim.fn.system { 'tmux', 'set-environment', '-g', 'NVIM_FILE', base }
    else
      vim.fn.system { 'tmux', 'set-environment', '-gu', 'NVIM_FILE' }
    end
  end,
})

-- auto format all buffers on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    require('conform').format { bufnr = args.buf, lsp_format = 'fallback' }
  end,
})
