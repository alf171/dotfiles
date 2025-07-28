-- java lsp
-- ~/.config/nvim/lua/plugins/jdtls.lua
return {
    "neovim/nvim-lspconfig",
    opts = {
        setup = {
            jdtls = function(_, opts)
                opts.handlers = vim.tbl_deep_extend("force", opts.handlers or {}, {
                    ["language/status"] = function() end,
                    ["$/progress"] = function() end,
                })

                -- manually set project root
                opts.root_dir = require("lspconfig.util").root_pattern(".jdtls-root")

                require("lspconfig").jdtls.setup(opts)
                return true
            end,
        },
    },
}
