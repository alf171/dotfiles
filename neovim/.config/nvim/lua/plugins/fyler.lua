return {
  'A7Lavinraj/fyler.nvim',
  branch = 'stable',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    mappings = {
      -- can also use <ZZ/ZQ>
      q = 'CloseView',
      l = 'Select',
      h = 'CollapseNode',
      ['<C-t>'] = 'SelectTab',
      ['<C-v>'] = 'SelectVSplit',
      ['<C-h>'] = 'GotoParent',
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('fyler').open { kind = 'float' }
      end,
      desc = 'Open Fyler',
    },
    {
      '<leader>c',
      function()
        require('fyler').open { kind = 'float', dir = vim.fn.expand '%:p:h' }
      end,
      desc = 'Open Fyler in current dir',
    },
  },
  win_opts = {
    relativenumbers = false,
  },
}
