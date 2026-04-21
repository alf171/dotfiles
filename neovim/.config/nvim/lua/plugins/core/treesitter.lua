return {
  pack = {
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    },
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    },
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
    },
  },
  setup = function()
    -- Keep the zz override independent from plugin init success.
    local ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not ok then
      return
    end

    configs.setup {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'diff',
        'json',
        'lua',
        'markdown',
        'python',
        'query',
        'typst',
        'vim',
        'vimdoc',
        'zig',
        'gitignore'
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
        },
        move = {
          enable = true,
        },
      },
    }

    local context = require('treesitter-context')
    -- NOTE: still a wip
    vim.keymap.set("n", "zz", function()
      local _, context_mod = pcall(require, 'treesitter-context.context')
      local _, context_util = pcall(require, 'treesitter-context.util')

      local context_ranges = context_mod.get(vim.api.nvim_get_current_win())
      if not context_ranges or #context_ranges == 0 then
        vim.cmd("normal! zz")
        return
      end

      local context_height = 0
      for _, range in ipairs(context_ranges) do
        context_height = context_height + context_util.get_range_height(range)
        vim.print("offseting by" .. context_height)
      end

    end, { desc = "Center cursor with treesitter context offset" })

    context.setup {
      enable = true,
      max_lines = 3,
      line_numbers = true,
      trim_scope = 'outer',
      mode = 'cursor',
      zindex = 20,
    }
  end,
}
