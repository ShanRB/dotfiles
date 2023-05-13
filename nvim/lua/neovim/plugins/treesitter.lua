return {
    -- Tree sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "p00f/nvim-ts-rainbow",
        },
        config = function()
            require("neovim.configs.treesitter")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("neovim.configs.autopairs")
        end,
    },
}