return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'folke/lazydev.nvim',
  },

  opts = {
    keymap = { preset = 'none' },

    appearance = { nerd_font_variant = 'mono' },

    completion = { documentation = { auto_show = false } },
    signature = { enabled = true, trigger = { enabled = false } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    snippets = { preset = 'luasnip' },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },

  config = function(_, opts)
    local blink = require 'blink.cmp'
    blink.setup(opts)
    local map = vim.keymap.set

    --- enable blink keys but only when blink pum is visible
    ---@param accept any method to run
    ---@param fallback any key to fallback if blink pum isn't visible
    ---@param pum_fallback any if neovim pum is not visible, use a different key
    ---@return function method to pass into km.set
    local function expr(accept, fallback, pum_fallback)
      return function()
        if blink.is_visible() then
          accept()
          return '<Ignore>'
        end
        if pum_fallback and vim.fn.pumvisible() == 1 then
          return pum_fallback
        end
        return fallback
      end
    end

    map('i', '<c-x><c-o>', function()
      blink.show()
    end, { nowait = true })

    -- K but in insert mode
    map('i', '<c-a>', function()
      if blink.is_signature_visible() then
        blink.hide_signature()
      else
        blink.show_signature()
      end
    end, { nowait = true, silent = true })

    -- accept keys
    map('i', '<tab>', expr(blink.accept, '<tab>'), { expr = true })
    map('i', '<cr>', expr(blink.accept, '<cr>'), { expr = true })
    map('i', '<c-y>', expr(blink.accept, '<c-y>'), { expr = true })

    -- scroll between blink auto complete w.r.t autocomplete
    map('i', '<C-j>', expr(blink.select_next, '<C-j>', '<C-n>'), { expr = true })
    map('i', '<C-k>', expr(blink.select_prev, '<C-k>', '<C-p>'), { expr = true })

    map('i', '<c-n>', blink.snippet_forward, { expr = true })
    map('i', '<c-p>', blink.snippet_backward, { expr = true })
  end,
}
