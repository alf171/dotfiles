return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    local map = vim.keymap.set
    -- q for quotes
    -- a for argument
    -- f for function call
    -- c for class def
    -- cilq / cinq for next and prev (helps for repeat)
    local ai = require 'mini.ai'
    ai.setup {
      n_lines = 500,
      custom_textobjects = {
        f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
        c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
      },
    }

    -- ysiwf<function name>
    -- dsf, dsq, csnq/cslq (for repeatable)
    local surround = require 'mini.surround'
    surround.setup {
      mappings = {
        add = 'ga',
        delete = 'ds',
        replace = 'cs',
        find = '',
        find_left = '',
        highlight = '',
        update_n_lines = '',
        suffix_last = 'l',
        suffix_next = 'n',
      },
      search_method = 'cover_or_next',
      n_lines = 200,
    }
    -- Map S in visual mode to add surround in visual mode
    -- ga is visual mode also works
    -- both don't work with . repeat like normal mode version of ga does
    map('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

    -- gr/grr for replace
    -- gm/gmm for multiply
    -- gx/gxx to exchange
    -- g=/g== to evaluate using Lua JIT
    -- default: gs/gss current: (NONE) sort
    require('mini.operators').setup {
      sort = { prefix = '' },
      mappings = {},
    }

    -- improved status bar
    require('mini.statusline').setup {}

    -- improved splitting and joining
    require('mini.splitjoin').setup {
      mappings = {
        toggle = '',
        split = 'gS',
        join = 'gJ',
      },
    }

    local buf_remove = require 'mini.bufremove'
    buf_remove.setup {}

    map('n', '<leader>x', function()
      buf_remove.delete(0, false)
    end, { silent = true, desc = 'Close tab (maintain windows)' })
    map('n', '<leader>X', '<cmd>bd<cr>', { silent = true, desc = 'Hard close tab' })
  end,
}
