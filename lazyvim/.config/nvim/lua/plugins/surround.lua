-- add surround ys <motion> <text>
-- change srround cs <text1> <text2>
-- delete surround ds <text>
return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup()
    end,
}
