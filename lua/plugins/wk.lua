vim.pack.add({
	"https://github.com/folke/which-key.nvim"
})

local wk = require("which-key")

wk.setup({
	-- 布局预设："classic"经典/"modern"现代/"helix"螺旋
	preset = "helix",
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = " ", -- symbol used between a key and it's label
		-- separator = "➜", -- symbol used between a key and it's label
		group = " + ", -- symbol prepended to a group
		ellipsis = "…",
		mappings = true,
		rules = {},
		-- use the highlights from mini.icons
		-- When `false`, it will use `WhichKeyIcon` instead
		colors = true,
		-- used by key format
		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰁮",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},
	win = {
		no_overlap = false, -- 禁止弹出窗口与光标重叠 width = 80,
		width = 80,
		height = { min = 4, max = 25 },
		padding = { 1, 1 }, -- 设置弹出窗口的内边距（上/下，左/右）
		title = " 快捷键列表 ", -- 显示窗口标题
		title_pos = "center", -- 标题位置
		zindex = 1000, -- 设置窗口的 z-index

		bo = {
		},
		wo = {
			winblend = 0, -- 弹窗背景0-100的不透明度，
		},
	},

	-- 在哪些模式下起作用
	-- n Normal 普通模式
	-- i Insert 插入模式
	-- x Visual 可视模式
	-- s Select 选择模式
	-- o Operator-pending 操作符等待模式
	triggers = {
		{
			"<auto>", mode = "n",
		},
	},
})

wk.add({
	{
		mode = { "n", "v" },
		{ "<leader>a", name = "文本对齐", icon = "󱇂 " },
		{ "<leader>A", name = "预览对齐", icon = "󱇂 " },
		{ "<leader>\\", name = "块注释", icon = "󰆈" },
		{ "<leader>c", group = "注释", icon = "󰆈 " },
		{ "<leader>cj", name = "向下注释", icon = "󰆈 " },
		{ "<leader>ck", name = "向上注释", icon = "󰆈 " },
		{ "<leader>cl", name = "行尾注释", icon = "󰆈 " },
		{ "<leader>ci", name = "注释签名", icon = "󰆈 " },
		{ "<leader>cu", name = "更新签名", icon = "󰆈 " },
		{ "<leader>f", group = "查找", icon = "󰮗 " },
		{ "<leader>w", group = "窗口", icon = " " },
		{ "<leader><tab>", group = "tab", icon = " " },
		{ "<leader>g", group = "git", icon = " " },
		{ "<leader>b", group = "buffer", icon = " " },
		{ "<leader>e", name = "文件浏览", icon = " " },
		{ "<leader>k", group = "添加括号", icon = "󰘦 " },
		{ "<leader><CR>", name = "换行开关", icon = "󰌑 " },
		{ "<leader>o", group = "其他键位", icon = " " },
		{ "<leader>d", group = "打印信息", icon = " " },
		{ "<leader>m", group = "Markdown", icon = " " },
		{ "<leader>h", group = "搜索与替换", icon = " " },
		{ "<leader>x", group = "诊断信息", icon = "󰨰 " },
		{ "<leader>u", group = "文件设置/显示", icon = " " },
		{ "<leader><Bar>", group = "显示日期", icon = "󰔟 " },
		--
	},
	{
		mode = "n",
		{ "<leader>s", group = "拼写", icon = "", },
	},
})
