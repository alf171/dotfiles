vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

vim.api.nvim_create_autocmd('BufWritePost', {
  buffer = 0,
  callback = function()
    vim.system({ 'zig', 'fmt', vim.api.nvim_buf_get_name(0) }, {}, function()
      vim.schedule(function()
        if vim.api.nvim_buf_is_loaded(0) then
          vim.cmd.checktime()
        end
      end)
    end)
  end,
})
