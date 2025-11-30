return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-mini/mini.icons' },
  config = function()
    local fzf = require 'fzf-lua'
    local km = vim.keymap

    km.set('n', '<leader>f', function()
      fzf.files {
        previewer = { enabled = false },
      }
    end, { desc = 'search for file with exact name' })

    km.set('n', '<leader>sf', function()
      fzf.files()
    end, { desc = 'fuzzy search for files with preview' })

    km.set('n', '<leader>sg', function()
      fzf.live_grep()
    end, { desc = 'grep for contents of a file' })

    km.set('n', '<leader>o', function()
      fzf.buffers {
        previewer = { enabled = false },
      }
    end, { desc = 'list open buffers' })

    km.set('n', '<leader>ca', function()
      fzf.lsp_code_actions {
        previewer = { enabled = false },
        silent = true,
      }
    end, { desc = 'suggest a code action' })
  end,
}
