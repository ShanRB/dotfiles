return {
    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = function()
            require("neovim.configs.telescope")
        end,
    },
}