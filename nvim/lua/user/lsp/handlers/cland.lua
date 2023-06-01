local capabilities = require("utils.lsp").capabilities
capabilities.offsetEncoding = "utf-8"

return {
    capabilities = capabilities,
    cmd = {
    	"clangd",
    	"--background-index",
    	"--pch-storage=memory",
    	"--clang-tidy",
    	"--suggest-missing-includes",
    	"--cross-file-rename",
    	"--completion-style=detailed",
    },
    init_options = {
    	clangdFileStatus = true,
    	usePlaceholders = true,
    	completeUnimported = true,
    	semanticHighlighting = true,
    }
}