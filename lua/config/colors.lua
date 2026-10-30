local vim = vim
vim.g.cls_gui = ({

	black       = "#262626",
	bg1 = "#2c313a", -- 次级背景/边框
	bg2   = "#3e4452", -- 非活动元素
	bg3        = "#5c6370", -- 注释/非活动文本
	bg4  = "#7f848e", -- 弱化文本
	fg       = "#e5e3ef", -- 主前景色

	-- 灰度值
	gray0       = "#000000",
	gray5       = "#0D0D0D",
	gray10      = "#1A1A1A",
	gray15      = "#262626",
	gray20      = "#333333",
	gray25      = "#404040",
	gray30      = "#4D4D4D",
	gray35      = "#595959",
	gray40      = "#666666",
	gray45      = "#737373",
	gray50      = "#808080",
	gray55      = "#8C8C8C",
	gray60      = "#999999",
	gray65      = "#A6A6A6",
	gray70      = "#B3B3B3",
	gray75      = "#BFBFBF",
	gray80      = "#CCCCCC",
	gray85      = "#D9D9D9",
	gray90      = "#E6E6E6",
	gray95      = "#F2F2F2",
	gray100     = "#ffffff",

	-- 标准色
	red         = "#FF0000",
	orange      = "#FFA500",
	yellow      = "#FFFF00",
	green       = "#008000",
	cyan        = "#00FFFF",
	blue        = "#0000FF",
	purple      = "#800080",
	pink        = "#ff79c6",

	-- 浅色系
	lightred    = "#fd8989",
	lightorange = "#FFDAB9",
	lightyellow = "#FFFACD",
	lightgreen  = "#90EE90",
	lightcyan   = "#E0FFFF",
	lightblue   = "#ADD8E6",
	lightpurple = "#D8BFD8",
	lightpink   = "#FFB6C1",
	light       = {
		black       = "#101012",
		bg0         = "#fafafa",
		bg1         = "#f0f0f0",
		bg2         = "#e6e6e6",
		bg3         = "#dcdcdc",
		fg          = "#383a42",

		red         = "#e45649",
		orange      = "#c18401",
		yellow      = "#986801",
		green       = "#50a14f",
		cyan        = "#0184bc",
		blue        = "#4078f2",
		purple      = "#a626a4",
		pink        = "#FF79C6",
		grey        = "#a0a1a7",
		light_grey  = "#818387",

		dark_cyan   = "#2b5d63",
		dark_red    = "#833b3b",
		dark_yellow = "#7c5c20",
		dark_purple = "#79428a",

		diff_add    = "#e2fbe4",
		diff_delete = "#fce2e5",
		diff_change = "#e2ecfb",
		diff_text   = "#cad3e0",
	},
	-- 深色系
	darkred     = "#8B0000",
	darkorange  = "#FF8C00",
	darkyellow  = "#e1df43",
	darkgreen   = "#006400",
	darkcyan    = "#008B8B",
	darkblue    = "#00008B",
	darkpurple  = "#4B0082",
	darkpink    = "#c84294",
	dark        = {
		black       = "#181a1f",
		bg0         = "#282c34",
		bg1         = "#31353f",
		bg2         = "#393f4a",
		bg3         = "#3b3f4c",
		fg          = "#abb2bf",

		red         = "#e86671",
		orange      = "#d19a66",
		yellow      = "#e5c07b",
		green       = "#98c379",
		cyan        = "#56b6c2",
		blue        = "#61afef",
		purple      = "#c678dd",
		pink        = "#8B3A62",
		grey        = "#5c6370",
		light_grey  = "#848b98",

		dark_cyan   = "#2b6f77",
		dark_red    = "#993939",
		dark_yellow = "#93691d",
		dark_purple = "#8a3fa0",

		diff_add    = "#31392b",
		diff_delete = "#382b2c",
		diff_change = "#1c3448",
		diff_text   = "#2c5372",
	},

	-- ----------------------------
	-- 语义色
	-- ----------------------------
	error       = "#f25151", -- 错误 / 删除 / 危险操作（柔和玫红，不刺眼）
	warn        = "#f4f65b", -- 警告 / 提示 / 待办事项（麦黄，醒目但不焦躁）
	info        = "#7dcfff", -- 信息 / 水色元素 / 状态提示（天青，清爽冷静）
	hint        = "#9ece6a", -- 成功 / 新增内容 / 建议（抹茶绿，积极友好）
	link        = "#7aa2f7", -- 超链接 / 按钮 / 可交互元素（矢车菊蓝，明确可点击）
	keyword     = "#bb9af7", -- 关键字 / 特殊状态 / 强调（薰衣草紫，突出但不抢眼）
})

vim.g.cls_cterm = ({
	-- ----------------------------
	-- 基础灰色
	-- ----------------------------
	black       = 236, -- #303030
	gray_darker = 236, -- #303030
	gray_dark   = 238, -- #444444
	gray        = 241, -- #626262
	gray_light  = 102, -- #878787
	white       = 255, -- #EEEEEE

	-- ----------------------------
	-- 灰度值
	-- ----------------------------
	gray0       = 0, -- #000000
	gray5       = 232, -- #080808
	gray10      = 234, -- #1C1C1C
	gray15      = 235, -- #262626
	gray20      = 236, -- #303030
	gray25      = 238, -- #444444
	gray30      = 239, -- #4E4E4E
	gray35      = 240, -- #585858
	gray40      = 241, -- #626262
	gray45      = 243, -- #767676
	gray50      = 8, -- #808080
	gray55      = 245, -- #8A8A8A
	gray60      = 246, -- #949494
	gray65      = 248, -- #A8A8A8
	gray70      = 249, -- #B2B2B2
	gray75      = 7, -- #C0C0C0
	gray80      = 252, -- #D0D0D0
	gray85      = 253, -- #DADADA
	gray90      = 254, -- #E4E4E4
	gray95      = 255, -- #EEEEEE
	gray100     = 15, -- #FFFFFF

	-- ----------------------------
	-- 标准色
	-- ----------------------------
	red         = 9, -- #FF0000
	orange      = 214, -- #FFAF00
	yellow      = 11, -- #FFFF00
	green       = 2, -- #008000
	cyan        = 14, -- #00FFFF
	blue        = 12, -- #0000FF
	purple      = 5, -- #800080
	pink        = 212, -- #FF87D7

	-- 浅色系
	lightred    = 210, -- #FD8989  亮红色
	lightorange = 223, -- #FFDAB9  浅橙色
	lightyellow = 230, -- #FFFACD  浅黄色
	lightgreen  = 120, -- #90EE90  浅绿色
	lightcyan   = 195, -- #E0FFFF  浅青色
	lightblue   = 152, -- #ADD8E6  浅蓝色
	lightpurple = 182, -- #D8BFD8  浅紫色
	lightpink   = 217, -- #FFB6C1  浅粉色
	light       = {
		black       = 233, -- #101012
		bg0         = 231, -- #fafafa
		bg1         = 255, -- #f0f0f0
		bg2         = 254, -- #e6e6e6
		bg3         = 253, -- #dcdcdc
		fg          = 237, -- #383a42

		red         = 167, -- #e45649
		orange      = 136, -- #c18401
		yellow      = 136, -- #986801
		green       = 71, -- #50a14f
		cyan        = 31, -- #0184bc
		blue        = 69, -- #4078f2
		purple      = 133, -- #a626a4
		pink        = 212, -- #FF79C6
		grey        = 247, -- #a0a1a7
		light_grey  = 245, -- #818387

		dark_cyan   = 23, -- #2b5d63
		dark_red    = 88, -- #833b3b
		dark_yellow = 94, -- #7c5c20
		dark_purple = 97, -- #79428a

		diff_add    = 194, -- #e2fbe4
		diff_delete = 224, -- #fce2e5
		diff_change = 189, -- #e2ecfb
		diff_text   = 188, -- #cad3e0
	},

	darkred     = 88, -- #8B0000 深红色
	darkorange  = 208, -- #FF8C00 深橙色
	darkyellow  = 184, -- #e1df43 深黄色
	darkgreen   = 22, -- #006400 深绿色
	darkcyan    = 30, -- #008B8B 深青色
	darkblue    = 18, -- #00008B 深蓝色
	darkpurple  = 54, -- #4B0082 深紫色
	darkpink    = 168, -- #c84294 深粉色
	dark        = {
		black       = 234, -- #181a1f
		bg0         = 235, -- #282c34
		bg1         = 236, -- #31353f
		bg2         = 237, -- #393f4a
		bg3         = 237, -- #3b3f4c
		fg          = 249, -- #abb2bf

		red         = 203, -- #e86671
		orange      = 173, -- #d19a66
		yellow      = 180, -- #e5c07b
		green       = 108, -- #98c379
		cyan        = 73, -- #56b6c2
		blue        = 75, -- #61afef
		purple      = 176, -- #c678dd
		pink        = 168, -- #c84294
		grey        = 241, -- #5c6370

		dark_cyan   = 30, -- #2b6f77
		dark_red    = 88, -- #993939
		dark_yellow = 94, -- #93691d
		dark_purple = 97, -- #8a3fa0

		diff_add    = 237, -- #31392b
		diff_delete = 235, -- #382b2c
		diff_change = 23, -- #1c3448
		diff_text   = 24, -- #2c5372
	},

	-- ----------------------------
	-- 语义色
	-- ----------------------------
	error       = 203, -- #FF5F5F
	warn        = 227, -- #FFFF5F
	info        = 117, -- #87D7FF
	hint        = 149, -- #AFD75F
	link        = 111, -- #87AFFF
	keyword     = 141, -- #AF87FF
})
