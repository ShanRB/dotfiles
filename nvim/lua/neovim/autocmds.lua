local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_neovim_command
local namespace = vim.api.nvim_create_namespace

local utils = require "utils"
local is_available = utils.is_available


if is_available "alpha-nvim" then
  local group_name = augroup("alpha_settings", { clear = true })
--   autocmd("neovim", {
--     desc = "Disable status and tablines for alpha",
--     group = group_name,
--     pattern = "AlphaReady",
--     callback = function()
--       local prev_showtabline = vim.opt.showtabline
--       local prev_status = vim.opt.laststatus
--       vim.opt.laststatus = 0
--       vim.opt.showtabline = 0
--       vim.opt_local.winbar = nil
--       autocmd("BufUnload", {
--         pattern = "<buffer>",
--         callback = function()
--           vim.opt.laststatus = prev_status
--           vim.opt.showtabline = prev_showtabline
--         end,
--       })
--     end,
--   })
  autocmd("VimEnter", {
    desc = "Start Alpha when vim is opened with no arguments",
    group = group_name,
    callback = function()
      local should_skip = false
      if vim.fn.argc() > 0 or vim.fn.line2byte "$" ~= -1 or not vim.o.modifiable then
        should_skip = true
      else
        for _, arg in pairs(vim.v.argv) do
          if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
            should_skip = true
            break
          end
        end
      end
      if not should_skip then require("alpha").start(true, require("alpha").default_config) end
    end,
  })
end
