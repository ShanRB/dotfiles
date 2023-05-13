return {
  "folke/lazy.nvim",
  -- {
  --   "lewis6991/impatient.nvim",
  --   config = function()
  --       require("neovim.configs.impatient")
  --   end,
  -- },
  "nvim-lua/plenary.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("neovim.configs.which-key")
    end,
},
{
  "numToStr/Comment.nvim",
  config = function()
    require("neovim.configs.comment")
end,
},
}
