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
