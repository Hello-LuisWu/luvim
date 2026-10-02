local cls_gui = ({
	black       = "#333333",
	gray_darker = "#2c313a",   -- 次级背景/边框
	gray_dark   = "#3e4452",   -- 非活动元素
	gray        = "#5c6370",   -- 注释/非活动文本
	gray_light  = "#7f848e",   -- 弱化文本
	white       = "#f1f0f7",   -- 主前景色

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
	-- error
	-- warn
	-- info
	-- hint


	error   = "#f25151", -- 错误 / 删除 / 危险操作（柔和玫红，不刺眼）
	warn    = "#f4f65b", -- 警告 / 提示 / 待办事项（麦黄，醒目但不焦躁）
	info    = "#7dcfff", -- 信息 / 水色元素 / 状态提示（天青，清爽冷静）
	hint    = "#9ece6a", -- 成功 / 新增内容 / 建议（抹茶绿，积极友好）
	link    = "#7aa2f7", -- 超链接 / 按钮 / 可交互元素（矢车菊蓝，明确可点击）
	keyword = "#bb9af7", -- 关键字 / 特殊状态 / 强调（薰衣草紫，突出但不抢眼）
})

local cls_cterm = ({
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
	gray0       = 0,   -- #000000
	gray5       = 232, -- #080808
	gray10      = 234, -- #1C1C1C
	gray15      = 235, -- #262626
	gray20      = 236, -- #303030
	gray25      = 238, -- #444444
	gray30      = 239, -- #4E4E4E
	gray35      = 240, -- #585858
	gray40      = 241, -- #626262
	gray45      = 243, -- #767676
	gray50      = 8,   -- #808080
	gray55      = 245, -- #8A8A8A
	gray60      = 246, -- #949494
	gray65      = 248, -- #A8A8A8
	gray70      = 249, -- #B2B2B2
	gray75      = 7,   -- #C0C0C0
	gray80      = 252, -- #D0D0D0
	gray85      = 253, -- #DADADA
	gray90      = 254, -- #E4E4E4
	gray95      = 255, -- #EEEEEE
	gray100     = 15,  -- #FFFFFF

	-- ----------------------------
	-- 标准色
	-- ----------------------------
	red         = 9,   -- #FF0000
	orange      = 214, -- #FFAF00
	yellow      = 11,  -- #FFFF00
	green       = 2,   -- #008000
	cyan        = 14,  -- #00FFFF
	blue        = 12,  -- #0000FF
	purple      = 5,   -- #800080
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
	darkred     = 88,  -- #870000
	darkorange  = 208, -- #FF8700
	darkyellow  = 185, -- #D7D75F
	darkgreen   = 22,  -- #005F00
	darkcyan    = 30,  -- #008787
	darkblue    = 18,  -- #000087
	darkpurple  = 54,  -- #5F0087
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

-- ============================================================================
-- onedark 风格高亮配置（Neovim Lua）
-- ============================================================================

local hl = vim.api.nvim_set_hl

-- ----------------------------------------------------------------------------
-- 基础界面与光标
-- ----------------------------------------------------------------------------
hl(0, "Normal", { fg = cls_gui.gray70, bg = cls_gui.black, ctermfg = cls_cterm.gray70, ctermbg = cls_cterm.black, }) -- 普通文本 
hl(0, "Cursor", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, }) -- 光标下的字符 
hl(0, "lCursor", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, }) -- 语言映射时光标下的字符 
hl(0, "CursorIM", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, }) -- IME 模式下的光标 
hl(0, "CursorColumn", { bg = cls_gui.gray_darker, ctermbg = cls_cterm.gray_darker, }) -- 光标所在的屏幕列 
hl(0, "CursorLine", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, }) -- 光标所在的屏幕行
hl(0, "ColorColumn", { bg = cls_gui.gray_darker, ctermbg = cls_cterm.gray_darker, }) -- colorcolumn 
hl(0, "Conceal", { fg = cls_gui.gray10, ctermfg = cls_cterm.gray10, }) -- 隐藏文本的占位符 
hl(0, "EndOfBuffer", { fg = cls_gui.gray_dark, ctermfg = cls_cterm.gray_dark, }) -- 缓冲区末尾的填充行 
hl(0, "NonText", { fg = cls_gui.gray10, ctermfg = cls_cterm.gray10, }) -- 不可见特殊字符 
hl(0, "SpecialKey", { fg = cls_gui.gray10, ctermfg = cls_cterm.gray10, }) -- 特殊键及空白字符

-- ----------------------------------------------------------------------------
-- 注释与语法
-- ----------------------------------------------------------------------------
hl(0, "vimComment", { fg = cls_gui.gray20, ctermfg = cls_cterm.gray20, bg = "NONE", italic = true, }) -- Vim Script 注释 
hl(0, "Comment", { fg = cls_gui.gray40, ctermfg = cls_cterm.gray40, bg = "NONE", italic = true, }) -- 通用注释

-- ----------------------------------------------------------------------------
-- 搜索与替换
-- ----------------------------------------------------------------------------
hl(0, "Search", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 上次搜索模式的高亮
hl(0, "CurSearch", { fg = cls_gui.gray_darker, bg = cls_gui.hint, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.hint, }) -- 当前搜索匹配
hl(0, "IncSearch", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 增量搜索高亮
hl(0, "MatchParen", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, underline = true, bold = true, }) -- 匹配的括号
hl(0, "Substitute", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })  -- :substitute 替换文本

-- ----------------------------------------------------------------------------
-- 差异模式 (Diff)
-- ----------------------------------------------------------------------------
hl(0, "DiffAdd", { fg = cls_gui.hint, bg = cls_gui.gray_darker, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.gray_darker, })     -- Diff 模式：新增的行
hl(0, "DiffChange", { fg = cls_gui.darkyellow, bg = cls_gui.gray_darker, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_darker, })  -- Diff 模式：改变的行
hl(0, "DiffDelete", { fg = cls_gui.error, bg = cls_gui.gray_darker, ctermfg = cls_cterm.error, ctermbg = cls_cterm.gray_darker, })  -- Diff 模式：删除的行
hl(0, "DiffText", { fg = cls_gui.darkyellow, bg = cls_gui.gray_dark, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_dark, })    -- Diff 模式：行内改变的文字
hl(0, "DiffTextAdd", { fg = cls_gui.hint, bg = cls_gui.gray_dark, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.gray_dark, }) -- Diff 模式：行内新增的文字

-- ----------------------------------------------------------------------------
-- 消息与命令行
-- ----------------------------------------------------------------------------
hl(0, "ErrorMsg", { fg = cls_gui.error, bg = "NONE", ctermfg = cls_cterm.error, ctermbg = "NONE", bold = true, }) -- 命令行上的错误消息
hl(0, "WarningMsg", { fg = cls_gui.warn, bg = "NONE", ctermfg = cls_cterm.warn, ctermbg = "NONE", })            -- 警告消息
hl(0, "ModeMsg", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", bold = true, })  -- showmode 消息
hl(0, "MsgArea", { fg = cls_gui.white, bg = "NONE", ctermfg = cls_cterm.white, ctermbg = "NONE", })               -- 命令行区域
hl(0, "MoreMsg", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })               -- more-prompt
hl(0, "Question", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })              -- hit-enter 提示
hl(0, "Title", { fg = cls_gui.darkyellow, bg = "NONE", ctermfg = cls_cterm.darkyellow, ctermbg = "NONE", bold = true, })    -- :set all、:autocmd 等输出的标题
hl(0, "MessageWindow", { fg = cls_gui.darkyellow, bg = cls_gui.gray_dark, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_dark, })      -- :echowindow 使用的消息弹出窗口
hl(0, "OkMsg", { fg = cls_gui.hint, ctermfg = cls_cterm.hint, })                              -- 成功消息
hl(0, "StderrMsg", { fg = cls_gui.error, ctermfg = cls_cterm.error, })                          -- 标准错误消息
hl(0, "StdoutMsg", { fg = cls_gui.white, ctermfg = cls_cterm.white, })                          -- 标准输出消息
hl(0, "MsgSeparator", { fg = cls_gui.gray_dark, ctermfg = cls_cterm.gray_dark, })  -- 滚动消息的分隔符

-- ----------------------------------------------------------------------------
-- 弹出菜单与补全
-- ----------------------------------------------------------------------------
hl(0, "Pmenu", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })                      -- 弹出菜单：普通项
hl(0, "PmenuSel", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 弹出菜单：选中项
hl(0, "PmenuKind", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", })                  -- 弹出菜单：普通项的 kind
hl(0, "PmenuKindSel", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })               -- 弹出菜单：选中项的 kind
hl(0, "PmenuExtra", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                 -- 弹出菜单：普通项的额外文本
hl(0, "PmenuExtraSel", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })              -- 弹出菜单：选中项的额外文本
hl(0, "PmenuSbar", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                                  -- 弹出菜单：滚动条
hl(0, "PmenuThumb", { bg = cls_gui.gray, ctermbg = cls_cterm.gray, })                                 -- 弹出菜单：滚动条滑块
hl(0, "PmenuMatch", { fg = cls_gui.hint, bg = cls_gui.gray_darker, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.gray_darker, bold = true, })    -- 弹出菜单：普通项中的匹配文本
hl(0, "PmenuMatchSel", { fg = cls_gui.hint, bg = cls_gui.darkyellow, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.darkyellow, bold = true, }) -- 弹出菜单：选中项中的匹配文本
hl(0, "PmenuBorder", { fg = cls_gui.gray_dark, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray_dark, ctermbg = cls_cterm.gray_darker, })                -- 弹出菜单：边框字符
hl(0, "PmenuShadow", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                                -- 弹出菜单：阴影
hl(0, "PmenuShadowThrough", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                         -- 弹出菜单：阴影角落
hl(0, "ComplMatchIns", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", bold = true, })    -- 当前插入的补全匹配文本
hl(0, "PreInsert", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                     -- preinsert 插入的文本
hl(0, "PopupSelected", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })              -- popup_menu() 弹出窗口
hl(0, "PopupNotification", { fg = cls_gui.darkyellow, bg = cls_gui.gray_darker, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_darker, })          -- popup_notification() 弹出窗口
hl(0, "WildMenu", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })                   -- wildmenu 补全中的当前匹配
hl(0, "ComplHint", { fg = cls_gui.gray, ctermfg = cls_cterm.gray, })                                  -- 当前补全的虚拟文本
hl(0, "ComplHintMore", { fg = cls_gui.link, ctermfg = cls_cterm.link, })                              -- 补全虚拟文本的附加信息

-- ----------------------------------------------------------------------------
-- 状态栏、标签页与窗口
-- ----------------------------------------------------------------------------
hl(0, "StatusLine", { fg = cls_gui.gray80, bg = cls_gui.gray30, ctermfg = cls_cterm.gray80, ctermbg = cls_cterm.gray30, bold = true, })        -- 当前窗口的状态行
hl(0, "StatusLineNC", { fg = cls_gui.darkyellow, bg = cls_gui.gray_dark, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_dark, })                -- 非当前窗口的状态行
hl(0, "StatusLineTerm", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, bold = true, }) -- 当前终端窗口的状态行
hl(0, "StatusLineTermNC", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })            -- 非当前终端窗口的状态行
hl(0, "VertSplit", { fg = cls_gui.gray_dark, bg = "NONE", ctermfg = cls_cterm.gray_dark, ctermbg = "NONE", })                      -- 垂直分割窗口的分隔列（旧名）
hl(0, "WinSeparator", { fg = cls_gui.gray_dark, bg = "NONE", ctermfg = cls_cterm.gray_dark, ctermbg = "NONE", })                   -- 窗口分隔符（Neovim 新名）
hl(0, "TabLineFill", { fg = cls_gui.gray90, bg = cls_gui.gray30, ctermfg = cls_cterm.gray90, ctermbg = cls_cterm.gray30, bold = true, })       -- 标签页行：没有标签的地方
hl(0, "TabLine", { fg = cls_gui.darkred, bg = cls_gui.gray30, ctermfg = cls_cterm.darkred, ctermbg = cls_cterm.gray30, })                        -- 标签页行：非活动标签页标签
hl(0, "TabLineSel", { fg = cls_gui.gray90, bg = cls_gui.gray20, ctermfg = cls_cterm.gray90, ctermbg = cls_cterm.gray10, bold = true, })     -- 标签页行：活动标签页标签
hl(0, "TabPanel", { fg = cls_gui.gray, bg = cls_gui.gray_dark, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_dark, })                    -- TabPanel：非活动标签页标签
hl(0, "TabPanelFill", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                -- TabPanel：没有标签的地方
hl(0, "TabPanelSel", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, bold = true, })    -- TabPanel：活动标签页标签
hl(0, "Terminal", { fg = cls_gui.white, bg = "NONE", ctermfg = cls_cterm.white, ctermbg = "NONE", })                       -- terminal 窗口
hl(0, "SignColumn", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                     -- 显示 signs 的列
hl(0, "Folded", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                      -- 关闭折行使用的行
hl(0, "FoldColumn", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                     -- foldcolumn
hl(0, "CursorLineFold", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                 -- 光标行的折叠列
hl(0, "CursorLineSign", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                 -- 光标行的符号列
hl(0, "WinBar", { fg = cls_gui.white, bg = cls_gui.gray_darker, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_darker, bold = true, })         -- 当前窗口的窗口栏
hl(0, "WinBarNC", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                    -- 非当前窗口的窗口栏
hl(0, "NormalNC", { fg = cls_gui.white, bg = cls_gui.black, ctermfg = cls_cterm.white, ctermbg = cls_cterm.black, })                    -- 非当前窗口的普通文本
hl(0, "NormalFloat", { fg = cls_gui.white, bg = cls_gui.gray_darker, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_darker, })  -- 浮动窗口的普通文本
hl(0, "FloatBorder", { fg = cls_gui.gray_dark, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray_dark, ctermbg = cls_cterm.gray_darker, })                 -- 浮动窗口边框
hl(0, "FloatTitle", { fg = cls_gui.darkyellow, bg = cls_gui.gray_darker, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_darker, bold = true, })     -- 浮动窗口标题
hl(0, "FloatFooter", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                 -- 浮动窗口页脚
hl(0, "FloatShadow", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                                 -- 浮动窗口阴影
hl(0, "FloatShadowThrough", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                          -- 浮动窗口阴影角落
hl(0, "TermCursor", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, })                  -- 终端中的光标

-- ----------------------------------------------------------------------------
-- 行号
-- ----------------------------------------------------------------------------
hl(0, "LineNr", { fg = cls_gui.gray35, bg = cls_gui.gray_darker,	ctermfg = cls_cterm.gray35, ctermbg = cls_cterm.gray_darker,	bold = true, })       -- 行号
hl(0, "LineNrAbove", { fg = cls_gui.gray35, bg = "NONE", ctermfg = cls_cterm.gray35, ctermbg = "NONE", })                  -- 光标上方的相对行号
hl(0, "LineNrBelow", { fg = cls_gui.gray_dark, bg = "NONE", ctermfg = cls_cterm.gray30, ctermbg = "NONE", })                  -- 光标下方的相对行号
hl(0, "CursorLineNr", { fg = cls_gui.gray45, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray45, ctermbg = cls_cterm.gray_darker, bold = true, }) -- 光标行的行号

-- ----------------------------------------------------------------------------
-- 目录与快速修复
-- ----------------------------------------------------------------------------
hl(0, "Directory", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", })    -- 目录名
hl(0, "QuickFixLine", { bg = cls_gui.gray_darker, ctermbg = cls_cterm.gray_darker, bold = true, }) -- quickfix 窗口中的当前项

-- ----------------------------------------------------------------------------
-- 拼写检查
-- ----------------------------------------------------------------------------
hl(0, 'SpellBad', { bg = 'NONE', fg = cls_cterm.gray40, underline = true })   -- 拼写检查器无法识别的单词
hl(0, "SpellCap", { fg = cls_gui.darkyellow, bg = "NONE", ctermfg = cls_cterm.darkyellow, ctermbg = "NONE", underline = true, })   -- 应以大写字母开头的单词
hl(0, "SpellLocal", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", underline = true, }) -- 在另一区域使用的单词
hl(0, "SpellRare", { fg = cls_gui.keyword, bg = "NONE", ctermfg = cls_cterm.keyword, ctermbg = "NONE", underline = true, })  -- 很少使用的单词

-- ----------------------------------------------------------------------------
-- 可视模式
-- ----------------------------------------------------------------------------
hl(0, "Visual", { fg = "NONE", bg = cls_gui.gray_dark, ctermfg = "NONE", ctermbg = cls_cterm.gray_dark, })    -- 可视模式选择
hl(0, "VisualNOS", { fg = "NONE", bg = cls_gui.gray_dark, ctermfg = "NONE", ctermbg = cls_cterm.gray_dark, }) -- Not Owning the Selection 时的可视模式

-- ----------------------------------------------------------------------------
-- 用户自定义 HighLight
-- ----------------------------------------------------------------------------
hl(0, "User1", { fg = cls_gui.error, bg = "NONE", ctermfg = cls_cterm.error, ctermbg = "NONE", })
hl(0, "User2", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })
hl(0, "User3", { fg = cls_gui.darkyellow, bg = "NONE", ctermfg = cls_cterm.darkyellow, ctermbg = "NONE", })
hl(0, "User4", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", })
hl(0, "User5", { fg = cls_gui.keyword, bg = "NONE", ctermfg = cls_cterm.keyword, ctermbg = "NONE", })
hl(0, "User6", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })
hl(0, "User7", { fg = cls_gui.white, bg = "NONE", ctermfg = cls_cterm.white, ctermbg = "NONE", })
hl(0, "User8", { fg = cls_gui.error, bg = "NONE", ctermfg = cls_cterm.error, ctermbg = "NONE", })
hl(0, "User9", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })

-- ----------------------------------------------------------------------------
-- 其他 Neovim 特有组
-- ----------------------------------------------------------------------------
hl(0, "Whitespace", { fg = cls_gui.gray_dark, ctermfg = cls_cterm.gray_dark, })                           -- listchars 中的空白字符
hl(0, "SnippetTabstop", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                       -- 片段中的制表位
hl(0, "SnippetTabstopActive", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 片段中当前活动的制表位

-- ----------------------------------------------------------------------------
-- GUI 专用组（在 Neovim 中通常无效，仅作占位）
-- ----------------------------------------------------------------------------
hl(0, "TitleBar", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })   -- 活动窗口标题栏（仅 MS-Windows GUI）
hl(0, "TitleBarNC", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, }) -- 非活动窗口标题栏（仅 MS-Windows GUI）
hl(0, "Menu", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })       -- 菜单/工具栏
hl(0, "Scrollbar", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })  -- 滚动条
hl(0, "Tooltip", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })    -- 工具提示

hl(0, "markdownH1", { fg = cls_gui.white, ctermfg = cls_cterm.white, bold = true, })
