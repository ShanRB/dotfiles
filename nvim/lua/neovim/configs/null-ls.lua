local  null_ls = require "null-ls"

local methods = null_ls.methods

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion


local get_source = require "user.lsp.null-ls-sources"
null_ls.setup({
    debug = false,
    sources = get_source(methods, code_actions, diagnostics, formatting, hover, completion),
    on_attach = require("utils.lsp").on_attach
})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
    return
end
mason_null_ls.setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})