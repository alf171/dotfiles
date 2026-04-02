return {
  pack = {
    {
      src = 'https://github.com/mason-org/mason.nvim',
      version = 'main',
    },
    {
      src = 'https://github.com/mason-org/mason-lspconfig.nvim',
      version = 'main',
    },
    {
      src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
      version = 'main',
    },
    {},
  },
  setup = function()
    require('mason').setup()
    require('mason-tool-installer').setup { ensure_installed = {} }
  end,
}
