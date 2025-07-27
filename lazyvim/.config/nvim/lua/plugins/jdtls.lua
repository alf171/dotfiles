-- java lsp
return {
    "neovim/nvim-lspconfig",
    opts = {
        setup = {
            jdtls = function(_, opts)
                opts.handlers = vim.tbl_deep_extend("force", opts.handlers or {}, {
                    ["language/status"] = function() end,
                    ["$/progress"] = function() end,
                })
                require("lspconfig").jdtls.setup(opts)
                return true -- prevents LazyVim from doing default setup
            end,
        },
    },
}
