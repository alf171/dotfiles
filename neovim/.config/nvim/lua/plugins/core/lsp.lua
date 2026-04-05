return {
  pack = {
    {
      src = 'https://github.com/mason-org/mason.nvim',
      version = 'main',
    },
    {
      src = 'https://github.com/neovim/nvim-lspconfig',
      version = 'master',
    },
    {
      src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
      version = 'main',
    },
    {
      src = 'https://github.com/j-hui/fidget.nvim',
      version = 'main',
    },
    {
      src = 'https://github.com/folke/lazydev.nvim',
      version = 'main',
    },
  },
  setup = function()
    require('mason').setup()

    local blink = require 'plugins.core.blink'
    local capabilities = blink.get_lsp_capabilities()
    local mason_bin = vim.fn.stdpath 'data' .. '/mason/bin/clangd'

    local servers = {
      clangd = {
        mason = 'clangd',
        cmd = { mason_bin, '--background-index', '--enable-config' },
      },
      lua_ls = {
        mason = 'lua-language-server',
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = { checkThirdParty = false },
            diagnostics = { globals = { 'vim' } },
            hint = { enable = true },
            semantic = { enable = true },
          },
        },
      },
      ts_ls = {
        mason = 'typescript-language-server',
      },
      marksman = {
        mason = 'marksman',
      },
      tinymist = {
        mason = 'tinymist',
      },
      typstyle = {
        mason = 'typstyle',
      },
      jsonls = {
        mason = 'json-lsp',
      },
      zls = {
        mason = 'zls',
        settings = {
          zls = {
            single_file_support = false,
            enable_build_on_save = true,
            build_on_save_step = 'run',
          },
        },
      },
      pyright = {
        mason = 'pyright',
      },
    }
    local ensure_installed = {}

    for _, cfg in pairs(servers) do
      if cfg.mason then
        ensure_installed[#ensure_installed + 1] = cfg.mason
      end
    end

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for server, cfg in pairs(servers) do
      cfg.capabilities = vim.tbl_deep_extend('force', {}, capabilities, cfg.capabilities or {})
      vim.lsp.config(server, cfg)
      vim.lsp.enable(server)
    end

    -- lsp progress
    require('fidget').setup {}

    -- nit: ft-lua
    require('lazydev').setup {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    }

    -- diagnostics
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    -- lsp attach
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- LSP go to def
        map('gd', function()
          vim.lsp.buf.definition { switchbuf = true }
        end, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gu', vim.lsp.buf.references, '[G]oto [U]sages')

        -- Jump to the implementation of the word under your cursor.
        map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        map('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')

        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })
  end,
}
