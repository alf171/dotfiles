return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-mini/mini.icons' },
  config = function()
    local fzf = require 'fzf-lua'
    local km = vim.keymap

    km.set('n', '<leader>f', function()
      fzf.files {
        previewer = false,
      }
    end, { desc = '' })

    km.set('n', '<leader>sf', function()
      fzf.files()
    end, { desc = '' })

    km.set('n', '<leader>sg', function()
      fzf.live_grep()
    end, { desc = '' })

    km.set('n', '<leader>o', function()
      fzf.buffers()
    end, { desc = '' })

    km.set('n', '<leader>ca', function()
      fzf.lsp_code_actions({
        previewer = false,
      })
    end, { desc = 'suggest a code action'})

  end,
}
