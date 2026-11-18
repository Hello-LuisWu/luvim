vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/yaocccc/nvim-hl-mdcodeblock.lua.git",
})

local Ts = require('nvim-treesitter')

Ts.install({
	'rust',
	'javascript',
	'zig',
	'html',
	'css',
	'c',
	'lua',
	'luadoc',
	'vim',
	'markdown',
	'markdown_inline',
	'bash',
	'zsh',
	'cpp',
	'rust',
	'vim',
	'vimdoc',
})


local guit   = vim.g.cls_gui.dark
require("hl-mdcodeblock").setup({
	-- 高亮组
	hl_group = "MDCodeBlock",

	-- 代码块背景颜色
	bg = "#22252c",

	-- 自动刷新事件
	events = {
		"FileChangedShellPost",
		"Syntax",
		"TextChanged",
		"TextChangedI",
		"InsertLeave",
		"WinScrolled",
		"BufEnter",
	},

	-- 右侧填充
	padding_right = 4,

	-- 刷新延迟
	timer_delay = 20,

	-- Treesitter 查询
	query_by_ft = {
		markdown = {
			"markdown",
			"(fenced_code_block) @codeblock",
		},
	},

	-- 最小高亮长度
	minumum_len = 1,
})
