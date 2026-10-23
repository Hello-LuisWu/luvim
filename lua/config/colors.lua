local vim = vim

vim.g.cls_gui = ({
	black       = "#262626",
	gray_darker = "#2c313a", -- 次级背景/边框
	gray_dark   = "#3e4452", -- 非活动元素
	gray        = "#5c6370", -- 注释/非活动文本
	gray_light  = "#7f848e", -- 弱化文本
	white       = "#e5e3ef", -- 主前景色

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
	lightpink   = "#FFB6C1",
	lightorange = "#FFDAB9",
	lightyellow = "#FFFACD",
	lightgreen  = "#90EE90",
	lightcyan   = "#E0FFFF",
	lightblue   = "#ADD8E6",
	lightpurple = "#D8BFD8",

	-- 深色系
	darkred     = "#8B0000",
	darkorange  = "#FF8C00",
	darkyellow  = "#e1df43",
	darkgreen   = "#006400",
	darkcyan    = "#008B8B",
	darkblue    = "#00008B",
	darkpurple  = "#4B0082",
	darkpink    = "#c84294",

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

	-- ----------------------------
	-- 浅色系
	-- ----------------------------
	lightred    = 210, -- #FF8787
	lightpink   = 217, -- #FFAFAF
	lightorange = 223, -- #FFD7AF
	lightyellow = 230, -- #FFFFD7
	lightgreen  = 120, -- #87FF87
	lightcyan   = 195, -- #D7FFFF
	lightblue   = 152, -- #AFD7D7
	lightpurple = 182, -- #D7AFD7

	-- ----------------------------
	-- 深色系
	-- ----------------------------
	darkred     = 88, -- #870000
	darkorange  = 208, -- #FF8700
	darkyellow  = 185, -- #D7D75F
	darkgreen   = 22, -- #005F00
	darkcyan    = 30, -- #008787
	darkblue    = 18, -- #000087
	darkpurple  = 54, -- #5F0087
	darkpink    = 168, -- #D75F87

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

vim.g.cls = ({
	bg1      = "#39383b",
	bg2      = "#8d89a3",
	bg3      = "#e4e3e5",
	bg4      = "#cbcbcf",
	fg      = "",
	error   = "",
	warn    = "",
	info    = "",
	hint    = "",
	link    = "#952fc9",
	keyword = "",

})
