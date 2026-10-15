-- local group = vim.api.nvim_create_augroup("setupIndentscope", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
--     group = group,
-- once = true,
-- callback = function()
--     -- 已加载则跳过
--     if package.loaded["ibl"] then
--         vim.api.nvim_del_augroup_by_id(group)
--         return
--     end

vim.pack.add({
	{
		src = "https://github.com/echasnovski/mini.indentscope",
		version = "stable"
	},
	"https://github.com/lukas-reineke/indent-blankline.nvim"
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = vim.g.cls_gui.gray35 })
local mini = require("mini.indentscope")
mini.setup({
	-- 绘制设置
	draw = {
		-- 光标移动后，延迟多少毫秒开始绘制缩进范围
		-- 100：延迟 100ms
		delay = 100,

		-- 绘制动画
		-- none()：关闭动画，立即绘制
		-- animation = require("mini.indentscope").gen_animation.none(),

		-- 自动绘制条件
		-- 仅当代码块范围计算完整时才绘制
		predicate = function(scope)
			return not scope.body.is_incomplete
		end,

		-- 绘制优先级
		-- 数值越大，越容易显示在其他符号上层
		priority = 2,
	},

	-- 快捷键映射
	mappings = {
		-- ii：选择当前缩进范围，不包括边界
		object_scope = "ii",

		-- ai：选择当前缩进范围，包括边界
		object_scope_with_border = "ai",

		-- [i：跳转到当前缩进范围的顶部边界
		goto_top = "[i",

		-- ]i：跳转到当前缩进范围的底部边界
		goto_bottom = "]i",
	},

	-- 缩进范围计算选项
	options = {
		-- 如何确定缩进范围的边界
		-- both：同时识别上边界和下边界
		-- top：只识别上边界
		-- bottom：只识别下边界
		-- none：不识别边界
		border = "both",

		-- 是否使用光标所在列的缩进作为参考
		-- true：水平移动光标时，可以观察不同的缩进范围
		indent_at_cursor = true,

		-- 向上、向下搜索范围时允许检查的最大行数
		-- 1000：允许搜索较大的代码块
		n_lines = 1000,

		-- 是否优先判断当前行是不是相邻代码块的边界
		-- true：光标位于函数声明等边界行时，也尝试识别其内部范围
		try_as_border = false,
	},

	-- 缩进范围指示符
	-- 可以使用 ASCII 字符、Unicode 字符或 Nerd Font 图标
	symbol = '┃',
})

local highlight = {
	"RainbowGray"
	-- "RainbowRed",
	-- "RainbowCyan",
	-- "RainbowYellow",
	-- "RainbowBlue",
	-- "RainbowOrange",
	-- "RainbowGreen",
	-- "RainbowViolet",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowGray", { fg = vim.g.cls_gui.gray20 })
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({
	indent = {
		char = "┃",
		highlight = highlight,
	},
	whitespace = {
		remove_blankline_trail = true,
		highlight = highlight,
	},
	scope = {
		enabled = false,

	},
})
--         vim.api.nvim_del_augroup_by_id(group)
--     end
-- })
