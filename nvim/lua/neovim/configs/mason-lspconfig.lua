local status_ok, servers = pcall(require, "user.lsp.servers")
if not status_ok then
    servers = {}
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local utils = require "utils"
local lsp = require "utils.lsp"

local handlers = {
    function(server) lsp.setup(server) end
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "user.lsp.handlers." .. server)
    if require_ok then

        conf_opts = utils.extend_tbl(conf_opts, opts)
        local overrides = {
            [server] = function()
                lspconfig[server].setup(opts)
            end
        }
        handlers = utils.extend_tbl(handlers, overrides)
    end
end

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
    handlers = handlers,
})
