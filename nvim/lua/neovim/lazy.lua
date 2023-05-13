local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local output = vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.api.nvim_get_vvar("shell_error") ~= 0 then
    vim.api.nvim_err_writeln("Error cloning lazy.nvim repository...\n\n" .. output)
  end
end
vim.opt.rtp:prepend(lazypath)

local spec = {
    { "LazyVim/LazyVim", import = "neovim.plugins" },
  }

local colorscheme = defaults.colorscheme and { defaults.colorscheme } or nil

require("lazy").setup({
    spec = spec,
    defaults = {
        lazy = false,
    },
    install = {
        colorscheme = { colorscheme = colorscheme },
    },
    performance = {
        cache = {
        enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
             ---@type string[]
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                -- "tutor",
                "zipPlugin",
            },
        },
    },
    lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
})
