return {
  pack = {
    src = 'https://github.com/nvim-mini/mini.tabline',
  },
  setup = function()
    require('mini.tabline').setup {
      show_icons = true,
      format = nil,
      tabpage_section = 'left',
    }
  end,
}
