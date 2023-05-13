local status_ok, servers = pcall(require, "user.lsp.servers")
if not status_ok then
    servers = {}
end

return {
    ensure_installed = servers,
    automatic_installation = true,
}
