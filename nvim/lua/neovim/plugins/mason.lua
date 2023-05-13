return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
          require("neovim.configs.mason")
        end,
    },
}