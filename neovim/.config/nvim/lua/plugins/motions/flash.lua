-- this is a very minimal flash implementation to just support s as search
-- this is to not interfer with S" and the speed of f"
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      char = { enabled = false },
    },
  },
  keys = {
    {
      's',
      mode = 'n',
      function()
        require('flash').jump()
      end,
      desc = 'Flash Search',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
  },
}
