return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- q for quotes
    -- a for argument
    -- f for function call
    -- F for function def
    -- cilq / cinq for next and prev (helps for repeat)
    local ai = require 'mini.ai'
    ai.setup {
      n_lines = 500,
      custom_textobjects = {
        -- B = MiniExtra.gen_ai_spec.buffer(),
        F = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
      },
    }

    -- ysiwf<function name>
    -- dsf, dsq, csnq/cslq (for repeatable)
    require('mini.surround').setup {
      mappings = {
        add = 'ga',
        delete = 'ds',
        replace = 'cs',
        find = '',
        find_left = '',
        highlight = '',
        update_n_lines = '',
        suffix_last = '',
        suffix_next = '',
      },
      search_method = 'cover_or_next',
      n_lines = 200,
    }
    -- Map S in visual mode to add surround in visual mode
    vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { desc = 'Add surround (visual)', silent = true, noremap = true })

    -- gr/grr for replace
    -- gm/gmm for multiply
    -- gx/gxx to exchange
    -- g=/g== to evaluate using Lua JIT
    -- default: gs/gss current: (NONE) sort
    require('mini.operators').setup {
      sort = { prefix = '' },
      mappings = {},
    }

    -- animate cursor movement
    -- local animate = require 'mini.animate'
    -- animate.setup {
    --   cursor = {
    --     enabled = true,
    --     timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
    --   },
    --   scroll = {
    --     enabled = true,
    --     timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
    --   },
    --   resize = {
    --     enabled = true,
    --     timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
    --   },
    --   open = {
    --     enabled = true,
    --     timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
    --   },
    --   closed = {
    --     enabled = true,
    --     timing = animate.gen_timing.linear { duration = 200, unit = 'total' },
    --   },
    -- }

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
  end,
}
