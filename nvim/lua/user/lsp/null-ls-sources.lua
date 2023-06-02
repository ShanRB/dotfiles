local null_ls = require("null-ls")
return function(methods, code_actions, diagnostics, formatting, hover, completion)
    local source = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        formatting.stylua,
        -- python
        diagnostics.flake8.with({
            diagnostic_config = {
                virtual_text = false, severity_sort = true,
            },
            diagnostics_format = "[#{c}] #{m} (#{s})",
            method = methods.DIAGNOSTICS_ON_SAVE,
            extra_args = { "--config", vim.fn.expand("~/.config/flake8") },
        }),
        formatting.black.with({ extra_args = { "--line-length", "119" } }),
        formatting.isort.with({ extra_args = { "--profile", "black", "--line-length", "119" } }),
        -- git
        code_actions.gitsigns,
        completion.spell,
        diagnostics.flake8
    }
    return source
end
