return {
  pack = {
    src = 'https://github.com/wakatime/vim-wakatime',
  },
  setup = function()
    require('wakatime').setup()
  end,
}
