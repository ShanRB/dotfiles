local util = require("lspconfig/util")
return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
    --[[ cmd = { "python", "-m", "pyright" }, ]]
    on_new_config = function(new_config, new_root_dir)
        new_config.settings.python.pythonPath = util.path.join(new_root_dir, ".venv", "bin", "python3")
    end,
}