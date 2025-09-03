-- this is a very minimal flash implementation to just support s as search
-- this is to interfer with S" and the speed of f"
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
  },
}
