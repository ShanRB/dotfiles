local time = os.date("%A, %d-%B-%Y %H:%M:%S")
local v = vim.version()
local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local logo = [[

█████╗ ██╗     ███████╗██╗  ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔══██╗██║     ██╔════╝╚██╗██╔╝    ████╗  ██║██║   ██║██║████╗ ████║
███████║██║     █████╗   ╚███╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║
██╔══██║██║     ██╔══╝   ██╔██╗     ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║  ██║███████╗███████╗██╔╝ ██╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                                     

      ]]
dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.header.opts.hl = "DashboardHeader"
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}
dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.1) }
dashboard.config.layout[3].val = 5
dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		dashboard.section.footer.val = {
            "  Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms",
            " 󰅐 Today is " .. time .. "         ",
        }
		--pcall(vim.cmd.AlphaRedraw)
	end,
})
