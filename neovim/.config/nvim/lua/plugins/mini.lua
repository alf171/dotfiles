return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- q for quotes
    -- a for argument
    -- f for function call
    -- cilq / cinq for next and prev (helps for repeat)
    require('mini.ai').setup {
      n_lines = 500,
      custom_textobjects = nil,
    }

    -- ysiwf<function name>
    -- dsf, dsq, csnq/cslq (for repeatable)
    require('mini.surround').setup {
      mappings = {
        add = 'ys',
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

    -- gr/grr for replace
    -- gm/gmm for multiply
    -- gx/gxx to exchange
    -- g=/g== to evaluate using Lua JIT
    -- gs/gss sort
    require('mini.operators').setup {
      mappings = {},
    }
  end,
}
