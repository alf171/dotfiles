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
    local ok, treesitter = pcall(require, 'nvim-treesitter')
    if not ok then
      return
    end

    local languages = {
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
    }

    treesitter.setup({
      install_dir = vim.fn.stdpath('data') .. "/site",
    })

    treesitter.install(languages)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('user_treesitter_start', { clear = true }),
        callback = function()
          pcall(vim.treesitter.start)
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

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
