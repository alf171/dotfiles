return {
  pack = {
    src = 'https://github.com/windwp/nvim-autopairs',
  },
  setup = function()
    require('nvim-autopairs').setup { map_cr = false }
  end,
}
