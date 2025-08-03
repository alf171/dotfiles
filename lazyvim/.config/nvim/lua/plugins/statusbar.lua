return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        local peach = "#fab387"
        local gray = "#3c3f41"

        opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
            theme = {
                normal = {
                    a = { fg = gray, bg = peach, gui = "bold" },
                    b = { fg = peach, bg = gray },
                    c = { fg = peach, bg = gray },
                },
                insert = {
                    a = { fg = gray, bg = peach, gui = "bold" },
                },
                visual = {
                    a = { fg = gray, bg = peach, gui = "bold" },
                },
                replace = {
                    a = { fg = gray, bg = peach, gui = "bold" },
                },
                inactive = {
                    a = { fg = peach, bg = gray },
                    b = { fg = peach, bg = gray },
                    c = { fg = peach, bg = gray },
                },
            },
        })

        opts.sections = {
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = { { "filename", path = 1 } },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        }
    end,
}
