return {
  -- 'alf171/quill.nvim',
  dir = '~/projects/nvim-plugins/quill.nvim/',
  config = function()
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
