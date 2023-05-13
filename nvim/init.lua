for _, source in ipairs {
  "defaults",
  "neovim.options",
  "neovim.lazy",
  "neovim.autocmds",
  "neovim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if defaults.colorscheme then
  if not pcall(vim.cmd.colorscheme, defaults.colorscheme) then
    vim.notify("Error setting up colorscheme: " .. settings.default_colorscheme, vim.log.levels.ERROR)
  end
end
