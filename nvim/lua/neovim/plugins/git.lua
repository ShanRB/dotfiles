return {
    -- git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("neovim.configs.gitsigns")
        end,
    },
  {
    "tpope/vim-fugitive",
  }
}
