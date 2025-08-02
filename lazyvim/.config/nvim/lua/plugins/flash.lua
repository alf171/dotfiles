return {
    "folke/flash.nvim",
    keys = {
        { "s", mode = { "n", "x" }, false },
        -- enable flash in normal mode
        {
            "s",
            mode = "n",
            function()
                require("flash").jump()
            end,
            desc = "Flash Jump",
        },
        -- enable flash in visual mode
        {
            "s",
            mode = "x",
            function()
                require("flash").jump()
            end,
            desc = "Flash Jump (Visual)",
        },
    },
}
