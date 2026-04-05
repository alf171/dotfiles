return {
  pack = {
    {
      src = 'https://github.com/nvim-lua/plenary.nvim',
    },
    {
      src = 'https://github.com/folke/todo-comments.nvim',
    },
  },
  setup = function()
    require('todo-comments').setup()
  end,
}
