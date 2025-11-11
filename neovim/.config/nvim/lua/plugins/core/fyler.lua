return {
  'A7Lavinraj/fyler.nvim',
  branch = 'stable',
  dependencies = { 'echasnovski/mini.icons' },
  opts = {
    views = {
      finder = {
        mappings = {
          -- can also use <ZZ/ZQ>
          ['q'] = 'CloseView',
          ['<CR>'] = 'Select',
          -- move in current view
          ['<C-l>'] = 'Select',
          ['<C-h>'] = 'CollapseNode',
          -- shift view
          ['<C-p>'] = 'GotoParent',
          ['<C-n>'] = 'GotoNode',
          -- open things
          ['<C-t>'] = 'SelectTab',
          ['<C-v>'] = 'SelectVSplit',
          -- misc
          -- [''] = 'SelectSplit',
          -- ['='] = 'GotoCwd',
          -- ['!'] = 'CollapseAll',
        },
        win_opts = {
          relativenumbers = false,
        },
      },
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
      '<leader>l',
      function()
        require('fyler').open { kind = 'split_right' }
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
}
