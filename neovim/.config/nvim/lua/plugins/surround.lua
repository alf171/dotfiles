-- change srround cs <text1> <text2>
-- delete surround ds <text>
-- add surround ys <motion> <text>
-- S<text> also adds surrounding whatever is visually selected
return {
  'kylechui/nvim-surround',
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup()
  end,
}
