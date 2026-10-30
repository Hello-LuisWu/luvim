local vim    = vim
local hl     = vim.api.nvim_set_hl
local gui    = vim.g.cls_gui
local cterm  = vim.g.cls_cterm
-- local guil = vim.g.cls_gui.light
local guit   = vim.g.cls_gui.dark
-- local cterml = vim.g.cls_cterm.light
local ctermt = vim.g.cls_cterm.dark


-- ----------------------------------------------------------------------------
-- 基础界面与光标
-- ----------------------------------------------------------------------------
-- 普通文本
hl(0, "Normal", {
	fg      = guit.fg,
	bg      = guit.bg0,
	-- bg      = "NONE",
	ctermfg = ctermt.fg,
	ctermbg = ctermt.black,
	-- ctermbg = "NONE",
})

-- 光标下的字符
hl(0, "Cursor", {
	fg      = guit.black,
	bg      = guit.fg,
	ctermfg = ctermt.black,
	ctermbg = ctermt.fg,
})

-- 语言映射时光标下的字符
hl(0, "lCursor", {
	fg      = guit.black,
	bg      = guit.fg,
	ctermfg = ctermt.black,
	ctermbg = ctermt.fg,
})

-- IME 输入法模式下的光标
hl(0, "CursorIM", {
	fg      = guit.black,
	bg      = guit.fg,
	ctermfg = ctermt.black,
	ctermbg = ctermt.fg,
})

-- 光标所在的屏幕列
hl(0, "CursorColumn", {
	bg      = guit.bg1,
	ctermbg = ctermt.bg1,
})

-- 光标所在的屏幕行
hl(0, "CursorLine", {
	bg      = guit.bg1,
	ctermbg = ctermt.bg1,
})

-- 颜色列（ColorColumn）
hl(0, "ColorColumn", {
	bg      = guit.bg1,
	ctermbg = ctermt.bg1,
})

-- 隐藏文本的占位符
hl(0, "Conceal", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
})

-- 缓冲区末尾的填充行
hl(0, "EndOfBuffer", {
	fg      = guit.bg2,
	ctermfg = ctermt.bg2,
})

-- 不可见特殊字符
hl(0, "NonText", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
})

-- 特殊键及空白字符
hl(0, "SpecialKey", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
})

-- ----------------------------------------------------------------------------
-- 注释与语法
-- ----------------------------------------------------------------------------
-- Vim Script 注释
hl(0, "vimComment", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
	bg      = "NONE",
	ctermbg = "NONE",
	italic  = true,
})

-- 通用注释
hl(0, "Comment", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
	bg      = "NONE",
	ctermbg = "NONE",
	italic  = true,
})

-- 特殊注释：用于文档注释、特殊注释语法等。
hl(0, "SpecialComment", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
	bg      = "NONE",
	ctermbg = "NONE",
	italic  = true,
})

-- 文档注释：部分语法文件或插件会使用此组。
hl(0, "DocComment", {
	fg      = guit.grey,
	ctermfg = ctermt.grey,
	bg      = "NONE",
	ctermbg = "NONE",
	italic  = true,
})


-- ----------------------------------------------------------------------------
-- 搜索与替换
-- ----------------------------------------------------------------------------
-- 上次搜索模式的高亮
hl(0, "Search", {
	fg      = guit.black,
	bg      = guit.dark_yellow,
	ctermfg = ctermt.black,
	ctermbg = ctermt.dark_yellow,
})

-- 当前搜索匹配
hl(0, "CurSearch", {
	fg      = guit.black,
	bg      = gui.hint,
	ctermfg = ctermt.black,
	ctermbg = cterm.hint,
	bold    = true,
})

-- 增量搜索高亮
hl(0, "IncSearch", {
	fg      = guit.black,
	bg      = guit.dark_yellow,
	ctermfg = ctermt.black,
	ctermbg = ctermt.dark_yellow,
})

-- 匹配的括号
hl(0, "MatchParen", {
	fg        = guit.fg,
	bg        = guit.bg2,
	ctermfg   = ctermt.fg,
	ctermbg   = ctermt.bg2,
	underline = true,
	bold      = true,
})

-- :substitute 替换文本
hl(0, "Substitute", {
	fg      = guit.black,
	bg      = guit.dark_yellow,
	ctermfg = ctermt.black,
	ctermbg = ctermt.dark_yellow,
})

-- ----------------------------------------------------------------------------
-- 差异模式 (Diff)
-- ----------------------------------------------------------------------------
-- Diff 模式：新增的行
hl(0, "DiffAdd", {
	fg      = gui.hint,
	bg      = guit.diff_add,
	ctermfg = cterm.hint,
	ctermbg = ctermt.diff_add,
})

-- Diff 模式：改变的行
hl(0, "DiffChange", {
	fg      = guit.dark_yellow,
	bg      = guit.diff_change,
	ctermfg = ctermt.dark_yellow,
	ctermbg = ctermt.diff_change,
})

-- Diff 模式：删除的行
hl(0, "DiffDelete", {
	fg      = gui.error,
	bg      = guit.diff_delete,
	ctermfg = cterm.error,
	ctermbg = ctermt.diff_delete,
})

-- Diff 模式：行内改变的文字
hl(0, "DiffText", {
	fg      = guit.dark_yellow,
	bg      = guit.diff_text,
	ctermfg = ctermt.dark_yellow,
	ctermbg = ctermt.diff_text,
	bold    = true,
})

-- Diff 模式：行内新增的文字
hl(0, "DiffTextAdd", {
	fg      = gui.hint,
	bg      = guit.diff_add,
	ctermfg = cterm.hint,
	ctermbg = ctermt.diff_add,
	bold    = true,
})

-- ============================================================
-- 💬 消息区域与命令行消息高亮
-- ============================================================
-- 命令行错误消息
hl(0, "ErrorMsg", {
	fg      = gui.error, -- 前景色：错误红色
	bg      = "NONE", -- 背景透明
	ctermfg = cterm.error,
	ctermbg = "NONE",
	bold    = true, -- 加粗突出错误
})

-- 警告消息
hl(0, "WarningMsg", {
	fg      = gui.warn, -- 前景色：警告黄色
	bg      = "NONE",
	ctermfg = cterm.warn,
	ctermbg = "NONE",
})

-- showmode 显示的模式提示
hl(0, "ModeMsg", {
	fg      = gui.hint, -- 前景色：提示绿色
	bg      = "NONE",
	ctermfg = cterm.hint,
	ctermbg = "NONE",
	bold    = true,
})

-- 命令行消息区域
hl(0, "MsgArea", {
	fg      = guit.fg, -- 前景色：主题默认文字色
	bg      = guit.bg0, -- 背景色：主题基础背景色
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg0,
})

-- more-prompt 提示消息
hl(0, "MoreMsg", {
	fg      = gui.hint,
	bg      = "NONE",
	ctermfg = cterm.hint,
	ctermbg = "NONE",
})

-- hit-enter 等交互提示
hl(0, "Question", {
	fg      = gui.hint,
	bg      = "NONE",
	ctermfg = cterm.hint,
	ctermbg = "NONE",
})

-- 标题：例如 :set all、:autocmd 等输出中的标题
hl(0, "Title", {
	fg      = guit.dark_yellow, -- 前景色：深黄色
	bg      = "NONE",
	ctermfg = ctermt.dark_yellow,
	ctermbg = "NONE",
	bold    = true,
})

-- :echowindow 使用的消息弹出窗口
hl(0, "MessageWindow", {
	fg      = guit.dark_yellow,
	bg      = guit.bg1, -- 背景色：次级背景
	ctermfg = ctermt.dark_yellow,
	ctermbg = ctermt.bg1,
})

-- 成功消息
hl(0, "OkMsg", {
	fg      = gui.hint,
	bg      = "NONE",
	ctermfg = cterm.hint,
	ctermbg = "NONE",
})

-- 标准错误消息
hl(0, "StderrMsg", {
	fg      = gui.error,
	bg      = "NONE",
	ctermfg = cterm.error,
	ctermbg = "NONE",
})

-- 标准输出消息
hl(0, "StdoutMsg", {
	fg      = guit.fg,
	bg      = "NONE",
	ctermfg = ctermt.fg,
	ctermbg = "NONE",
})

-- 滚动消息之间的分隔符
hl(0, "MsgSeparator", {
	fg      = guit.grey,
	bg      = "NONE",
	ctermfg = ctermt.grey,
	ctermbg = "NONE",
})

-- ============================================================
-- 🧩 补全菜单与弹出窗口高亮
-- ============================================================
-- 补全菜单：普通项
hl(0, "Pmenu", {
	fg      = guit.fg, -- 普通文字
	bg      = guit.bg0, -- 菜单背景
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg0,
})

-- 补全菜单：选中项
hl(0, "PmenuSel", {
	fg      = guit.black, -- 选中文字
	bg      = gui.link, -- 选中背景：蓝色
	ctermfg = ctermt.black,
	ctermbg = cterm.link,
	bold    = true,
})

-- 补全菜单：普通项的 kind（类型）
hl(0, "PmenuKind", {
	fg      = gui.link,
	bg      = "NONE",
	ctermfg = cterm.link,
	ctermbg = "NONE",
})

-- 补全菜单：选中项的 kind
hl(0, "PmenuKindSel", {
	fg      = guit.black,
	bg      = gui.link,
	ctermfg = ctermt.black,
	ctermbg = cterm.link,
})

-- 补全菜单：普通项的额外文本
hl(0, "PmenuExtra", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 补全菜单：选中项的额外文本
hl(0, "PmenuExtraSel", {
	fg      = guit.black,
	bg      = gui.link,
	ctermfg = ctermt.black,
	ctermbg = cterm.link,
})

-- 补全菜单：滚动条轨道
hl(0, "PmenuSbar", {
	fg      = "NONE",
	bg      = guit.bg1,
	ctermfg = "NONE",
	ctermbg = ctermt.bg1,
})

-- 补全菜单：滚动条滑块
hl(0, "PmenuThumb", {
	fg      = "NONE",
	bg      = guit.grey,
	ctermfg = "NONE",
	ctermbg = ctermt.grey,
})

-- 补全菜单：普通项中的匹配文本
hl(0, "PmenuMatch", {
	fg      = gui.hint,
	bg      = guit.bg0,
	ctermfg = cterm.hint,
	ctermbg = ctermt.bg0,
	bold    = true,
})

-- 补全菜单：选中项中的匹配文本
hl(0, "PmenuMatchSel", {
	fg      = guit.black,
	bg      = gui.link,
	ctermfg = ctermt.black,
	ctermbg = cterm.link,
	bold    = true,
})

-- 补全菜单：边框字符
hl(0, "PmenuBorder", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 补全菜单：阴影
hl(0, "PmenuShadow", {
	fg      = "NONE",
	bg      = guit.black,
	ctermfg = "NONE",
	ctermbg = ctermt.black,
})

-- 补全菜单：阴影角落
hl(0, "PmenuShadowThrough", {
	fg      = "NONE",
	bg      = guit.black,
	ctermfg = "NONE",
	ctermbg = ctermt.black,
})

-- 当前插入的补全匹配文本
hl(0, "ComplMatchIns", {
	fg      = gui.hint,
	bg      = "NONE",
	ctermfg = cterm.hint,
	ctermbg = "NONE",
	bold    = true,
})

-- PreInsert：预插入文本
hl(0, "PreInsert", {
	fg      = guit.grey,
	bg      = "NONE",
	ctermfg = ctermt.grey,
	ctermbg = "NONE",
})

-- popup_menu()：弹出菜单中的选中项
hl(0, "PopupSelected", {
	fg      = guit.black,
	bg      = gui.link,
	ctermfg = ctermt.black,
	ctermbg = cterm.link,
	bold    = true,
})

-- popup_notification()：弹出通知窗口
hl(0, "PopupNotification", {
	fg      = guit.dark_yellow,
	bg      = guit.bg0,
	ctermfg = ctermt.dark_yellow,
	ctermbg = ctermt.bg0,
})

-- WildMenu：命令行补全中的当前匹配
hl(0, "WildMenu", {
	fg      = guit.black,
	bg      = gui.link,
	ctermfg = ctermt.black,
	ctermbg = cterm.link,
	bold    = true,
})

-- 当前补全的虚拟提示文本
hl(0, "ComplHint", {
	fg      = guit.grey,
	bg      = "NONE",
	ctermfg = ctermt.grey,
	ctermbg = "NONE",
})

-- 补全虚拟提示文本的附加信息
hl(0, "ComplHintMore", {
	fg      = gui.link,
	bg      = "NONE",
	ctermfg = cterm.link,
	ctermbg = "NONE",
})

-- ============================================================
-- 📊 状态栏 StatusLine
-- ============================================================

-- 当前窗口的状态行
hl(0, "StatusLine", {
	fg      = guit.fg, -- 前景色：主题默认文字色
	bg      = guit.bg1, -- 背景色：次级背景
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg1,
	bold    = true,
})

-- 非当前窗口的状态行
hl(0, "StatusLineNC", {
	fg      = guit.grey, -- 弱化文字
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 当前终端窗口的状态行
hl(0, "StatusLineTerm", {
	fg      = guit.fg,
	bg      = guit.bg1,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg1,
	bold    = true,
})

-- 非当前终端窗口的状态行
hl(0, "StatusLineTermNC", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})


-- ============================================================
-- 🪟 窗口分隔符
-- ============================================================

-- 垂直分割窗口的分隔列（兼容旧名称）
hl(0, "VertSplit", {
	fg      = guit.bg2,
	bg      = "NONE",
	ctermfg = ctermt.bg2,
	ctermbg = "NONE",
})

-- 窗口分隔符（Neovim 推荐使用的新名称）
hl(0, "WinSeparator", {
	fg      = guit.bg2,
	bg      = "NONE",
	ctermfg = ctermt.bg2,
	ctermbg = "NONE",
})


-- ============================================================
-- 🗂️ 标签栏 TabLine
-- ============================================================

-- 标签栏：没有标签的空白区域
hl(0, "TabLineFill", {
	fg      = guit.grey,
	bg      = guit.black,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.black,
})

-- 标签栏：非活动标签页
hl(0, "TabLine", {
	fg      = guit.grey,
	bg      = guit.bg1,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg1,
})

-- 标签栏：当前活动标签页
hl(0, "TabLineSel", {
	fg      = guit.black,
	bg      = guit.red,
	ctermfg = ctermt.black,
	ctermbg = ctermt.red,
	bold    = true,
})


-- ============================================================
-- 🗃️ TabPanel 标签面板
-- ============================================================

-- TabPanel：非活动标签页
hl(0, "TabPanel", {
	fg      = guit.grey,
	bg      = guit.bg1,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg1,
})

-- TabPanel：没有标签的区域
hl(0, "TabPanelFill", {
	fg      = guit.grey,
	bg      = guit.black,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.black,
})

-- TabPanel：活动标签页
hl(0, "TabPanelSel", {
	fg      = guit.fg,
	bg      = guit.bg2,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg2,
	bold    = true,
})


-- ============================================================
-- 🖥️ 终端 Terminal
-- ============================================================

-- 终端窗口的文本
hl(0, "Terminal", {
	fg      = guit.fg,
	bg      = "NONE",
	ctermfg = ctermt.fg,
	ctermbg = "NONE",
})

-- 终端中的光标
hl(0, "TermCursor", {
	fg      = guit.black,
	bg      = guit.fg,
	ctermfg = ctermt.black,
	ctermbg = ctermt.fg,
})


-- ============================================================
-- 📍 符号列 SignColumn
-- ============================================================

-- 显示诊断、Git 等 sign 的列
hl(0, "SignColumn", {
	fg      = guit.grey,
	bg      = "NONE",
	ctermfg = ctermt.grey,
	ctermbg = "NONE",
})


-- ============================================================
-- 📁 折叠 Fold
-- ============================================================

-- 折叠后的文本行
hl(0, "Folded", {
	fg      = guit.grey,
	bg      = guit.bg1,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg1,
})

-- 折叠标记列
hl(0, "FoldColumn", {
	fg      = guit.grey,
	bg      = "NONE",
	ctermfg = ctermt.grey,
	ctermbg = "NONE",
})

-- 光标所在行的折叠列
hl(0, "CursorLineFold", {
	fg      = guit.fg,
	bg      = "NONE",
	ctermfg = ctermt.fg,
	ctermbg = "NONE",
})

-- 光标所在行的符号列
hl(0, "CursorLineSign", {
	fg      = guit.fg,
	bg      = "NONE",
	ctermfg = ctermt.fg,
	ctermbg = "NONE",
})


-- ============================================================
-- 🏷️ 窗口栏 WinBar
-- ============================================================

-- 当前窗口的窗口栏
hl(0, "WinBar", {
	fg      = guit.fg,
	bg      = guit.bg0,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg0,
	bold    = true,
})

-- 非当前窗口的窗口栏
hl(0, "WinBarNC", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})


-- ============================================================
-- 📝 普通文本与浮动窗口
-- ============================================================

-- 非当前窗口的普通文本
hl(0, "NormalNC", {
	fg      = guit.fg,
	bg      = guit.black,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.black,
})

-- 浮动窗口的普通文本
hl(0, "NormalFloat", {
	fg      = guit.fg,
	bg      = guit.bg0,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg0,
})

-- 浮动窗口边框
hl(0, "FloatBorder", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 浮动窗口标题
hl(0, "FloatTitle", {
	fg      = guit.dark_yellow,
	bg      = guit.bg0,
	ctermfg = ctermt.dark_yellow,
	ctermbg = ctermt.bg0,
	bold    = true,
})

-- 浮动窗口页脚
hl(0, "FloatFooter", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 浮动窗口阴影
hl(0, "FloatShadow", {
	fg      = "NONE",
	bg      = guit.black,
	ctermfg = "NONE",
	ctermbg = ctermt.black,
})

-- 浮动窗口阴影角落
hl(0, "FloatShadowThrough", {
	fg      = "NONE",
	bg      = guit.black,
	ctermfg = "NONE",
	ctermbg = ctermt.black,
})

-- ----------------------------------------------------------------------------
-- 行号
-- ----------------------------------------------------------------------------
hl(0, "LineNr", { fg = gui.gray25, bg = "NONE", ctermfg = cterm.gray25, ctermbg = "NONE", })       -- 行号
hl(0, "LineNrAbove", { fg = gui.gray25, bg = "NONE", ctermfg = cterm.gray25, ctermbg = "NONE", })  -- 光标上方的相对行号
hl(0, "linenrbelow", { fg = gui.gray25, bg = "NONE", ctermfg = cterm.gray25, ctermbg = "none", })  -- 光标下方的相对行号
hl(0, "CursorLineNr", { fg = gui.gray40, bg = "NONE", ctermfg = cterm.gray40, ctermbg = "NONE", }) -- 光标行的行号

-- ============================================================
-- 📂 目录与 Quickfix 高亮
-- ============================================================
-- 目录名：使用蓝色，便于与普通文件区分
hl(0, "Directory", {
	fg      = gui.link, -- 前景色：链接蓝色
	bg      = "NONE", -- 背景透明
	ctermfg = cterm.link,
	ctermbg = "NONE",
})

-- Quickfix 窗口：当前选中项
hl(0, "QuickFixLine", {
	fg      = guit.fg, -- 前景色：主题默认文字色
	bg      = guit.bg1, -- 背景色：次级背景
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg1,
	bold    = true, -- 加粗突出当前项
})

-- ============================================================
-- ✍️ 拼写检查 Spell
-- ============================================================
-- 拼写错误：无法识别的单词
hl(0, "SpellBad", {
	fg        = guit.grey, -- 前景色：灰色
	bg        = "NONE", -- 背景透明
	ctermfg   = ctermt.grey,
	ctermbg   = "NONE",
	underline = true,   -- 下划线标记错误
	sp        = gui.error, -- GUI 下划线颜色：错误红色
})

-- 大小写错误：应以大写字母开头的单词
hl(0, "SpellCap", {
	fg        = guit.dark_yellow, -- 前景色：深黄色
	bg        = "NONE",
	ctermfg   = ctermt.dark_yellow,
	ctermbg   = "NONE",
	underline = true,
	sp        = gui.warn, -- GUI 下划线颜色：警告黄色
})

-- 本地拼写错误：在其他区域使用的单词
hl(0, "SpellLocal", {
	fg        = gui.link, -- 前景色：蓝色
	bg        = "NONE",
	ctermfg   = cterm.link,
	ctermbg   = "NONE",
	underline = true,
	sp        = gui.link, -- GUI 下划线颜色：链接蓝色
})

-- 罕见单词：很少使用的单词
hl(0, "SpellRare", {
	fg        = gui.keyword, -- 前景色：紫色
	bg        = "NONE",
	ctermfg   = cterm.keyword,
	ctermbg   = "NONE",
	underline = true,
	sp        = gui.keyword, -- GUI 下划线颜色：关键字紫色
})

-- ============================================================
-- 👁️ 可视模式 Visual
-- ============================================================
-- 可视模式：选中的文本区域
hl(0, "Visual", {
	fg      = "NONE", -- 保留原有文字颜色
	bg      = guit.bg2, -- 选择背景：较浅的深灰色
	ctermfg = "NONE",
	ctermbg = ctermt.bg2,
})

-- 可视模式：未拥有系统选择权时的选择区域
hl(0, "VisualNOS", {
	fg      = "NONE", -- 保留原有文字颜色
	bg      = guit.bg1, -- 选择背景：次级深色背景
	ctermfg = "NONE",
	ctermbg = ctermt.bg1,
})

-- ----------------------------------------------------------------------------
-- 🧩 其他 Neovim 特有组
-- ----------------------------------------------------------------------------
-- listchars：不可见空白字符
hl(0, "Whitespace", {
	fg      = guit.grey,
	bg      = "NONE",
	ctermfg = ctermt.grey,
	ctermbg = "NONE",
})

-- 代码片段：制表位区域
hl(0, "SnippetTabstop", {
	fg      = "NONE",
	bg      = guit.bg1,
	ctermfg = "NONE",
	ctermbg = ctermt.bg1,
})

-- 代码片段：当前活动的制表位
hl(0, "SnippetTabstopActive", {
	fg      = guit.black,
	bg      = guit.dark_yellow,
	ctermfg = ctermt.black,
	ctermbg = ctermt.dark_yellow,
	bold    = true,
})

-- ----------------------------------------------------------------------------
-- 🖥️ 传统 GUI 专用组
-- ----------------------------------------------------------------------------
-- 活动窗口标题栏（主要用于传统 Vim GUI）
hl(0, "TitleBar", {
	fg      = guit.fg,
	bg      = guit.bg1,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg1,
})

-- 非活动窗口标题栏（主要用于传统 Vim GUI）
hl(0, "TitleBarNC", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 菜单或工具栏（传统 GUI）
hl(0, "Menu", {
	fg      = guit.fg,
	bg      = guit.bg1,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg1,
})

-- 滚动条（传统 GUI）
hl(0, "Scrollbar", {
	fg      = guit.grey,
	bg      = guit.bg0,
	ctermfg = ctermt.grey,
	ctermbg = ctermt.bg0,
})

-- 工具提示（传统 GUI）
hl(0, "Tooltip", {
	fg      = guit.fg,
	bg      = guit.bg1,
	ctermfg = ctermt.fg,
	ctermbg = ctermt.bg1,
})

-- ===========================
-- 代码
-- ===========================
-- 字符串
hl(0, "String", {
	fg = guit.green,
	ctermfg = cterm.dark.green,
})

-- 函数
hl(0, "Function", {
	fg = guit.blue,
	ctermfg = ctermt.blue
})

-- 关键字
hl(0, "Keyword", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
	bold = true,
})

-- 普通标识符：变量名、未被进一步分类的标识符。
hl(0, "Identifier", {
	fg = guit.purple,
	ctermfg = cterm.dark.purple,
})

-- 类型: 数据类型名称
hl(0, "Type", {
	fg = guit.orange,
	ctermfg = cterm.dark.cyan,
})

-- 标签：部分语言中的 label、跳转标签等。
hl(0, "Label", {
	fg = guit.orange,
	ctermfg = ctermt.orange,
})

-- 语句：通用语句高亮的基础组。
hl(0, "Statement", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 条件语句：if、else、elseif 等。
hl(0, "Conditional", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})


-- 循环语句：for、while、repeat 等。
hl(0, "Repeat", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 运算符：传统语法高亮中的通用运算符。
hl(0, "Operator", {
	fg = guit.fg,
	ctermfg = ctermt.fg,
})

-- 异常处理：throw、try、catch、raise 等。
hl(0, "Exception", {
	fg = guit.red,
	ctermfg = ctermt.red,
})

-- 包含指令： C/C++ 的 #include 字段
hl(0, "Include", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 宏定义：例如 C/C++ 的 #define。
hl(0, "Define", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 字符常量：单个字符或字符字面量
hl(0, "Character", {
	fg = guit.green,
	ctermfg = ctermt.green,
})

-- 数字: 整数数字
hl(0, "Number", {
	fg = guit.orange,
	ctermfg = ctermt.orange,
})

-- 浮点数：带小数点或指数部分的数字。
hl(0, "Float", {
	fg = guit.orange,
	ctermfg = ctermt.orange,
})

-- 布尔值：true、false 等布尔常量。
hl(0, "Boolean", {
	fg = guit.orange,
	ctermfg = ctermt.orange,
})

-- 常量：通用常量。
hl(0, "Constant", {
	fg = guit.orange,
	ctermfg = ctermt.orange,
})

-- 特殊语法元素：由语法文件识别的特殊文本。
hl(0, "Special", {
	fg = guit.cyan,
	ctermfg = ctermt.cyan,
})

-- 特殊字符：字符串转义字符等。
hl(0, "SpecialChar", {
	fg = guit.cyan,
	ctermfg = ctermt.cyan,
})

-- 存储类别：static、extern、register 等（视语言而定）。
hl(0, "StorageClass", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 结构体或结构类型相关语法
hl(0, "Structure", {
	fg = guit.cyan,
	ctermfg = ctermt.cyan,
})

-- 类型别名声明：typedef 等。
hl(0, "Typedef", {
	fg = guit.cyan,
	ctermfg = ctermt.cyan,
})

-- 预处理指令：通用预处理语法。

hl(0, "PreProc", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

--  预处理条件：预处理器中的条件语法
hl(0, "PreCondit", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 宏：宏名称或宏调用，具体取决于语法文件。
hl(0, "Macro", {
	fg = guit.purple,
	ctermfg = ctermt.purple,
})

-- 预处理分隔符：部分语法文件中的预处理分隔元素。
hl(0, "PreProcSep", {
	fg = guit.grey,
	ctermfg = ctermt.grey,
})

-- 语法错误文本：由语法文件识别的错误内容。
hl(0, "Error", {
	fg = gui.error,
	ctermfg = cterm.error,
	bold = true,
})

-- 待办标记：TODO、FIXME 等，通常需要语法或插件支持。
hl(0, "Todo", {
	fg = gui.warn,
	ctermfg = cterm.warn,
	bold = true,
})

-- 带下划线的文本：传统语法中的强调或链接文本。
hl(0, "Underlined", {
	fg = gui.link,
	ctermfg = cterm.link,
	underline = true,
})

-- 忽略文本：部分语法文件会将此组用于弱化或隐藏文本
hl(0, "Ignore", {
	fg = guit.grey,
	ctermfg = ctermt.grey,
})

-- 分隔符：逗号、分号等，具体分类取决于语法文件。
hl(0, "Delimiter", {
	fg = guit.fg,
	ctermfg = ctermt.fg,
})

-- ============================================================
-- 1. 标题
-- ============================================================

hl(0, "@markup.heading", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true }) -- 通用标题：作为未指定层级时的回退样式
hl(0, "@markup.heading.1", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true })
hl(0, "@markup.heading.2", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true })
hl(0, "@markup.heading.3", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true })
hl(0, "@markup.heading.4", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true })
hl(0, "@markup.heading.5", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true })
hl(0, "@markup.heading.6", { fg = gui.link, bg = "NONE", ctermfg = cterm.link, ctermbg = "NONE", bold = true })

-- ============================================================
-- 2. 文本格式
-- ============================================================
hl(0, "@markup.strong", { fg = gui.white, bg = "NONE", ctermfg = cterm.white, ctermbg = "NONE", bold = true })         -- 粗体
hl(0, "@markup.italic", { fg = gui.white, bg = "NONE", ctermfg = cterm.white, ctermbg = "NONE", italic = true })       -- 斜体
hl(0, "@markup.strikethrough",
	{ fg = gui.white, bg = "NONE", ctermfg = cterm.white, ctermbg = "NONE", strikethrough = true })                    -- 删除线
hl(0, "@markup.underline", { fg = gui.white, bg = "NONE", ctermfg = cterm.white, ctermbg = "NONE", underline = true }) -- 下划线

-- ============================================================
-- 3. 行内代码与代码块
-- ============================================================
hl(0, "@markup.raw", { fg = gui.gray60, ctermfg = cterm.gray60, bold = false })             -- 行内原始文本 / 行内代码
hl(0, "@markup.raw.block", { fg = gui.link, ctermfg = cterm.link, bold = false })           -- 围栏代码块
hl(0, "@markup.math", { fg = gui.lightpurple, ctermfg = cterm.lightpurple, italic = true }) -- 数学公式

-- ============================================================
-- 4. 链接
-- ============================================================
hl(0, "@markup.link", { fg = gui.link, ctermfg = cterm.link })                       -- 通用链接
hl(0, "@markup.link.label", { fg = gui.link, ctermfg = cterm.link })                 -- 链接标签 / 引用标签
hl(0, "@markup.link.url", { fg = gui.info, ctermfg = cterm.info, underline = true }) -- URL 地址
hl(0, "@markup.link.title", { fg = gui.hint, ctermfg = cterm.hint, italic = true })  -- 链接标题

-- ============================================================
-- 5. 引用与列表
-- ============================================================
hl(0, "@markup.quote", { fg = gui.hint, ctermfg = cterm.hint, italic = true })      -- 引用块
hl(0, "@markup.list", { fg = gui.hint, ctermfg = cterm.hint, bold = true })         -- 列表标记
hl(0, "@markup.list.checked", { fg = gui.hint, ctermfg = cterm.hint, bold = true }) -- 已勾选任务
hl(0, "@markup.list.unchecked", { fg = gui.hint, ctermfg = cterm.hint })            -- 未勾选任务

-- ============================================================
-- 6. 标点符号
-- ============================================================
hl(0, "@punctuation.special", { fg = gui.gray_light, ctermfg = cterm.gray_light }) -- 特殊标点：例如部分 Markdown 语法标记
hl(0, "@punctuation.delimiter", { fg = gui.gray, ctermfg = cterm.gray })           -- 普通分隔符

-- ============================================================
-- 7. 代码围栏标签 / 元数据 / 转义
-- ============================================================
hl(0, "@label", { fg = gui.cyan, ctermfg = cterm.cyan })                   -- 语言标识等标签
hl(0, "@keyword.directive", { fg = gui.keyword, ctermfg = cterm.keyword }) -- YAML 元数据指令
hl(0, "@string.escape", { fg = gui.cyan, ctermfg = cterm.cyan })           -- 转义序列

-- ============================================================
-- 8. 拼写检查
-- ============================================================
-- 拼写检查文本不强制覆盖前景色，
-- 保留底层文字颜色，仅设置拼写提示下划线样式。
-- set_hl("@spell", {
--     undercurl = true,
--     sp = gui.warn,
-- })
