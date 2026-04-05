return {
  -- 'https://github.com/alf171/quill.nvim',
  pack = {
    src = vim.fn.expand('~/projects/nvim-plugins/quill.nvim/'),
  },
  setup = function()
    require('quill').setup {
      notes_path = '~/Desktop/notes/',
      keymaps = {
        open = '<leader>td',
        close = 'q',
        prev = '<C-p>',
        next = '<C-n>',
      },
      debug = true,
    }
  end,
}
