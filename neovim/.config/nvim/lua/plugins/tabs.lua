return {
  'akinsho/bufferline.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  config = function()
    local status_ok, bufferline = pcall(require, 'bufferline')
    if not status_ok then
      return
    end

    vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', { silent = true })
    vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', { silent = true })
    vim.keymap.set('n', '<leader>c', '<cmd>bd<CR>', { silent = true, desc = 'Close tab (buffer)' })

    vim.opt.termguicolors = true
    bufferline.setup {}
  end,
}
