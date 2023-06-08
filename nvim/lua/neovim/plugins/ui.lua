return {
	{
		"nvim-tree/nvim-web-devicons",
		enabled = vim.g.icons_enabled,
		opts = {
			override = {
				default_icon = { icon = require("utils").get_icon("DefaultFile") },
				deb = { icon = "", name = "Deb" },
				lock = { icon = "󰌾", name = "Lock" },
				mp3 = { icon = "󰎆", name = "Mp3" },
				mp4 = { icon = "", name = "Mp4" },
				out = { icon = "", name = "Out" },
				["robots.txt"] = { icon = "󰚩", name = "Robots" },
				ttf = { icon = "", name = "TrueTypeFont" },
				rpm = { icon = "", name = "Rpm" },
				woff = { icon = "", name = "WebOpenFontFormat" },
				woff2 = { icon = "", name = "WebOpenFontFormat2" },
				xz = { icon = "", name = "Xz" },
				zip = { icon = "", name = "Zip" },
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		init = function()
			require("utils").load_plugin_with_func("nvim-notify", vim, "notify")
		end,
		opts = {
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 1000 })
			end,
		},
	},
	-- {
	--   "lukas-reineke/indent-blankline.nvim",
	--   opts = {
	--     buftype_exclude = {
	--       "nofile",
	--       "terminal",
	--     },
	--     filetype_exclude = {
	--       "help",
	--       "startify",
	--       "aerial",
	--       "alpha",
	--       "dashboard",
	--       "lazy",
	--       "neogitstatus",
	--       "NvimTree",
	--       "neo-tree",
	--       "Trouble",
	--     },
	--     context_patterns = {
	--       "class",
	--       "return",
	--       "function",
	--       "method",
	--       "^if",
	--       "^while",
	--       "jsx_element",
	--       "^for",
	--       "^object",
	--       "^table",
	--       "block",
	--       "arguments",
	--       "if_statement",
	--       "else_clause",
	--       "jsx_element",
	--       "jsx_self_closing_element",
	--       "try_statement",
	--       "catch_clause",
	--       "import_statement",
	--       "operation_type",
	--     },
	--     show_trailing_blankline_indent = false,
	--     use_treesitter = true,
	--     char = "▏",
	--     context_char = "▏",
	--     show_current_context = true,
	--   },
	-- },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("neovim.configs.lualine")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
	},
	-- {
	--     "akinsho/bufferline.nvim",
	--     tag = "*",
	--     opts = {},
	-- },
}
