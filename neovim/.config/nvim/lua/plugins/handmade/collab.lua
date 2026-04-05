return {
  -- 'https://github.com/alf171/collab.nvim',
  pack = {
    src = vim.fn.expand '~/projects/nvim-plugins/collab.nvim',
  },
  setup = function()
    require('collab').setup()
  end,
}
