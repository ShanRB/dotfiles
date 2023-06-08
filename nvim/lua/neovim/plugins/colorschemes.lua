return {
    {
        -- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
        "folke/tokyonight.nvim",
        opts = { style = "moon" },
    },
    -- catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                alpha = true,
                cmp = true,
                gitsigns = true,
                mason = true,
                nvimtree = true,
                treesitter = true,
                telescope = true,
                notify = true,
                which_key = true,
            },
        },
    },
}
