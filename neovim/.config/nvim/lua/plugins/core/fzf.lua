return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-mini/mini.icons' },
  config = function(_, opts)
    local fzf = require 'fzf-lua'
    local map = vim.keymap.set
    fzf.setup(opts)

    map('n', '<leader>f', function()
      fzf.files {
        previewer = false,
      }
    end, { desc = 'search for file with exact name' })

    map('n', '<leader>sf', function()
      fzf.files()
    end, { desc = 'fuzzy search for files with preview' })

    map('n', '<leader>sg', function()
      fzf.live_grep()
    end, { desc = 'grep for contents of a file' })

    map('n', '<leader>s.', function()
      fzf.resume()
    end, { desc = 'resume a search' })

    map('n', '<leader>o', function()
      fzf.buffers {
        previewer = false,
      }
    end, { desc = 'list open buffers' })

    map('n', '<leader>ca', function()
      fzf.lsp_code_actions {
        previewer = false,
        silent = true,
      }
    end, { desc = 'suggest a code action' })
  end,
}
