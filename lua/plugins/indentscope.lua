local group = vim.api.nvim_create_augroup("setupIndentscope", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
--     group = group,
--     -- once = true,
--     callback = function()
--         -- 已加载则跳过
--         if package.loaded["ibl"] then
--             vim.api.nvim_del_augroup_by_id(group)
--             return
--         end

vim.pack.add({
	-- {
	--     src = "https://github.com/echasnovski/mini.indentscope",
	--     version = "stable"
	-- },
	"https://github.com/lukas-reineke/indent-blankline.nvim"
})

local highlight = {
	"RainbowRed",
	"RainbowCyan",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#333333", ctermfg = 233 })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({
	debounce = 300,
	-- indent = { char = "|" },
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = true,
	},
	scope = {
		enabled = false,

	},
})
--         vim.api.nvim_del_augroup_by_id(group)
--     end
-- })
