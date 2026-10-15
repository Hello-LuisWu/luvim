local vim  = vim
local hl = vim.api.nvim_set_hl

-- ============================================================================
-- onedark 风格高亮配置（Neovim Lua）
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 基础界面与光标
-- ----------------------------------------------------------------------------
hl(0, "Normal", { fg = vim.g.cls_gui.gray70, bg = vim.g.cls_gui.black, ctermfg = vim.g.cls_cterm.gray70, ctermbg = vim.g.cls_cterm.black, }) -- 普通文本 
hl(0, "Cursor", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.white, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.white, }) -- 光标下的字符 
hl(0, "lCursor", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.white, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.white, }) -- 语言映射时光标下的字符 
hl(0, "CursorIM", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.white, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.white, }) -- IME 模式下的光标 
hl(0, "CursorColumn", { bg = vim.g.cls_gui.gray_darker, ctermbg = vim.g.cls_cterm.gray_darker, }) -- 光标所在的屏幕列 
hl(0, "CursorLine", { bg = vim.g.cls_gui.gray20, ctermbg = vim.g.cls_cterm.gray20, }) -- 光标所在的屏幕行
hl(0, "ColorColumn", { bg = vim.g.cls_gui.gray_darker, ctermbg = vim.g.cls_cterm.gray_darker, }) -- colorcolumn 
hl(0, "Conceal", { fg = vim.g.cls_gui.gray10, ctermfg = vim.g.cls_cterm.gray10, }) -- 隐藏文本的占位符 
hl(0, "EndOfBuffer", { fg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.gray_dark, }) -- 缓冲区末尾的填充行 
hl(0, "NonText", { fg = vim.g.cls_gui.gray10, ctermfg = vim.g.cls_cterm.gray10, }) -- 不可见特殊字符 
hl(0, "SpecialKey", { fg = vim.g.cls_gui.gray10, ctermfg = vim.g.cls_cterm.gray10, }) -- 特殊键及空白字符

-- ----------------------------------------------------------------------------
-- 注释与语法
-- ----------------------------------------------------------------------------
hl(0, "vimComment", { fg = vim.g.cls_gui.gray20, ctermfg = vim.g.cls_cterm.gray20, bg = "NONE", italic = true, }) -- Vim Script 注释 
hl(0, "Comment", { fg = vim.g.cls_gui.gray40, ctermfg = vim.g.cls_cterm.gray40, bg = "NONE", italic = true, }) -- 通用注释

-- ----------------------------------------------------------------------------
-- 搜索与替换
-- ----------------------------------------------------------------------------
hl(0, "Search", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, }) -- 上次搜索模式的高亮
hl(0, "CurSearch", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.hint, }) -- 当前搜索匹配
hl(0, "IncSearch", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, }) -- 增量搜索高亮
hl(0, "MatchParen", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_dark, underline = true, bold = true, }) -- 匹配的括号
hl(0, "Substitute", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, })  -- :substitute 替换文本

-- ----------------------------------------------------------------------------
-- 差异模式 (Diff)
-- ----------------------------------------------------------------------------
hl(0, "DiffAdd", { fg = vim.g.cls_gui.hint, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.hint, ctermbg = vim.g.cls_cterm.gray_darker, })     -- Diff 模式：新增的行
hl(0, "DiffChange", { fg = vim.g.cls_gui.darkyellow, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = vim.g.cls_cterm.gray_darker, })  -- Diff 模式：改变的行
hl(0, "DiffDelete", { fg = vim.g.cls_gui.error, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.error, ctermbg = vim.g.cls_cterm.gray_darker, })  -- Diff 模式：删除的行
hl(0, "DiffText", { fg = vim.g.cls_gui.darkyellow, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = vim.g.cls_cterm.gray_dark, })    -- Diff 模式：行内改变的文字
hl(0, "DiffTextAdd", { fg = vim.g.cls_gui.hint, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.hint, ctermbg = vim.g.cls_cterm.gray_dark, }) -- Diff 模式：行内新增的文字

-- ----------------------------------------------------------------------------
-- 消息与命令行
-- ----------------------------------------------------------------------------
hl(0, "ErrorMsg", { fg = vim.g.cls_gui.error, bg = "NONE", ctermfg = vim.g.cls_cterm.error, ctermbg = "NONE", bold = true, }) -- 命令行上的错误消息
hl(0, "WarningMsg", { fg = vim.g.cls_gui.warn, bg = "NONE", ctermfg = vim.g.cls_cterm.warn, ctermbg = "NONE", })            -- 警告消息
hl(0, "ModeMsg", { fg = vim.g.cls_gui.hint, bg = "NONE", ctermfg = vim.g.cls_cterm.hint, ctermbg = "NONE", bold = true, })  -- showmode 消息
hl(0, "MsgArea", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray15, ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", })               -- 命令行区域
hl(0, "MoreMsg", { fg = vim.g.cls_gui.hint, bg = "NONE", ctermfg = vim.g.cls_cterm.hint, ctermbg = "NONE", })               -- more-prompt
hl(0, "Question", { fg = vim.g.cls_gui.hint, bg = "NONE", ctermfg = vim.g.cls_cterm.hint, ctermbg = "NONE", })              -- hit-enter 提示
hl(0, "Title", { fg = vim.g.cls_gui.darkyellow, bg = "NONE", ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = "NONE", bold = true, })    -- :set all、:autocmd 等输出的标题
hl(0, "MessageWindow", { fg = vim.g.cls_gui.darkyellow, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = vim.g.cls_cterm.gray_dark, })      -- :echowindow 使用的消息弹出窗口
hl(0, "OkMsg", { fg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.hint, })                              -- 成功消息
hl(0, "StderrMsg", { fg = vim.g.cls_gui.error, ctermfg = vim.g.cls_cterm.error, })                          -- 标准错误消息
hl(0, "StdoutMsg", { fg = vim.g.cls_gui.white, ctermfg = vim.g.cls_cterm.white, })                          -- 标准输出消息
hl(0, "MsgSeparator", { fg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.gray_dark, })  -- 滚动消息的分隔符

-- ----------------------------------------------------------------------------
-- 弹出菜单与补全
-- ----------------------------------------------------------------------------
hl(0, "Pmenu", { fg = vim.g.cls_gui.gray60, bg = vim.g.cls_gui.gray10, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray20, })                      -- 弹出菜单：普通项
hl(0, "PmenuSel", { fg = vim.g.cls_gui.white, bg = vim.g.cls.link, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.lightred, }) -- 弹出菜单：选中项
hl(0, "PmenuKind", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", })                  -- 弹出菜单：普通项的 kind
hl(0, "PmenuKindSel", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, })               -- 弹出菜单：选中项的 kind
hl(0, "PmenuExtra", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })                 -- 弹出菜单：普通项的额外文本
hl(0, "PmenuExtraSel", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, })              -- 弹出菜单：选中项的额外文本
hl(0, "PmenuSbar", { bg = vim.g.cls_gui.gray_dark, ctermbg = vim.g.cls_cterm.gray_dark, })                                  -- 弹出菜单：滚动条
hl(0, "PmenuThumb", { bg = vim.g.cls_gui.gray, ctermbg = vim.g.cls_cterm.gray, })                                 -- 弹出菜单：滚动条滑块
hl(0, "PmenuMatch", { fg = vim.g.cls_gui.hint, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.hint, ctermbg = vim.g.cls_cterm.gray_darker, bold = true, })    -- 弹出菜单：普通项中的匹配文本
hl(0, "PmenuMatchSel", { fg = vim.g.cls_gui.hint, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.hint, ctermbg = vim.g.cls_cterm.darkyellow, bold = true, }) -- 弹出菜单：选中项中的匹配文本
hl(0, "PmenuBorder", { fg = vim.g.cls_gui.gray_dark, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray_dark, ctermbg = vim.g.cls_cterm.gray_darker, })                -- 弹出菜单：边框字符
hl(0, "PmenuShadow", { bg = vim.g.cls_gui.gray_dark, ctermbg = vim.g.cls_cterm.gray_dark, })                                -- 弹出菜单：阴影
hl(0, "PmenuShadowThrough", { bg = vim.g.cls_gui.gray_dark, ctermbg = vim.g.cls_cterm.gray_dark, })                         -- 弹出菜单：阴影角落
hl(0, "ComplMatchIns", { fg = vim.g.cls_gui.hint, bg = "NONE", ctermfg = vim.g.cls_cterm.hint, ctermbg = "NONE", bold = true, })    -- 当前插入的补全匹配文本
hl(0, "PreInsert", { fg = vim.g.cls_gui.gray, bg = "NONE", ctermfg = vim.g.cls_cterm.gray, ctermbg = "NONE", })                     -- preinsert 插入的文本
hl(0, "PopupSelected", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, })              -- popup_menu() 弹出窗口
hl(0, "PopupNotification", { fg = vim.g.cls_gui.darkyellow, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = vim.g.cls_cterm.gray_darker, })          -- popup_notification() 弹出窗口
hl(0, "WildMenu", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, })                   -- wildmenu 补全中的当前匹配
hl(0, "ComplHint", { fg = vim.g.cls_gui.gray, ctermfg = vim.g.cls_cterm.gray, })                                  -- 当前补全的虚拟文本
hl(0, "ComplHintMore", { fg = vim.g.cls_gui.link, ctermfg = vim.g.cls_cterm.link, })                              -- 补全虚拟文本的附加信息

-- ----------------------------------------------------------------------------
-- 状态栏、标签页与窗口
-- ----------------------------------------------------------------------------
hl(0, "StatusLine", { fg = vim.g.cls_gui.gray80, bg = vim.g.cls_gui.gray10, ctermfg = vim.g.cls_cterm.gray80, ctermbg = vim.g.cls_cterm.gray10, bold = true, })        -- 当前窗口的状态行
hl(0, "StatusLineNC", { fg = vim.g.cls_gui.darkyellow, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = vim.g.cls_cterm.gray_dark, })                -- 非当前窗口的状态行
hl(0, "StatusLineTerm", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_dark, bold = true, }) -- 当前终端窗口的状态行
hl(0, "StatusLineTermNC", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })            -- 非当前终端窗口的状态行
hl(0, "VertSplit", { fg = vim.g.cls_gui.gray_dark, bg = "NONE", ctermfg = vim.g.cls_cterm.gray_dark, ctermbg = "NONE", })                      -- 垂直分割窗口的分隔列（旧名）
hl(0, "WinSeparator", { fg = vim.g.cls_gui.gray_dark, bg = "NONE", ctermfg = vim.g.cls_cterm.gray_dark, ctermbg = "NONE", })                   -- 窗口分隔符（Neovim 新名）
hl(0, "TabLineFill", { fg = vim.g.cls_gui.gray90, bg = vim.g.cls_gui.black, ctermfg = vim.g.cls_cterm.gray90, ctermbg = vim.g.cls_cterm.gray10, bold = true, })       -- 标签页行：没有标签的地方
hl(0, "TabLine", { fg = vim.g.cls_gui.gray0, bg = vim.g.cls_gui.gray40, ctermfg = vim.g.cls_cterm.gray50, ctermbg = vim.g.cls_cterm.gray20, })                        -- 标签页行：非活动标签页标签
hl(0, "TabLineSel", { fg = vim.g.cls_gui.black, bg = vim.g.cls_gui.gray70, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.link, bold = true, })     -- 标签页行：活动标签页标签
hl(0, "TabPanel", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_dark, })                    -- TabPanel：非活动标签页标签
hl(0, "TabPanelFill", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })                -- TabPanel：没有标签的地方
hl(0, "TabPanelSel", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_dark, bold = true, })    -- TabPanel：活动标签页标签
hl(0, "Terminal", { fg = vim.g.cls_gui.white, bg = "NONE", ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", })                       -- terminal 窗口
hl(0, "SignColumn", { fg = vim.g.cls_gui.gray, bg = "NONE", ctermfg = vim.g.cls_cterm.gray, ctermbg = "NONE", })                     -- 显示 signs 的列
hl(0, "Folded", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })                      -- 关闭折行使用的行
hl(0, "FoldColumn", { fg = vim.g.cls_gui.gray, bg = "NONE", ctermfg = vim.g.cls_cterm.gray, ctermbg = "NONE", })                     -- foldcolumn
hl(0, "CursorLineFold", { fg = vim.g.cls_gui.gray, bg = "NONE", ctermfg = vim.g.cls_cterm.gray, ctermbg = "NONE", })                 -- 光标行的折叠列
hl(0, "CursorLineSign", { fg = vim.g.cls_gui.gray, bg = "NONE", ctermfg = vim.g.cls_cterm.gray, ctermbg = "NONE", })                 -- 光标行的符号列
hl(0, "WinBar", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_darker, bold = true, })         -- 当前窗口的窗口栏
hl(0, "WinBarNC", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })                    -- 非当前窗口的窗口栏
hl(0, "NormalNC", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.black, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.black, })                    -- 非当前窗口的普通文本
hl(0, "NormalFloat", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_darker, })  -- 浮动窗口的普通文本
hl(0, "FloatBorder", { fg = vim.g.cls_gui.gray_dark, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray_dark, ctermbg = vim.g.cls_cterm.gray_darker, })                 -- 浮动窗口边框
hl(0, "FloatTitle", { fg = vim.g.cls_gui.darkyellow, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = vim.g.cls_cterm.gray_darker, bold = true, })     -- 浮动窗口标题
hl(0, "FloatFooter", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })                 -- 浮动窗口页脚
hl(0, "FloatShadow", { bg = vim.g.cls_gui.gray_dark, ctermbg = vim.g.cls_cterm.gray_dark, })                                 -- 浮动窗口阴影
hl(0, "FloatShadowThrough", { bg = vim.g.cls_gui.gray_dark, ctermbg = vim.g.cls_cterm.gray_dark, })                          -- 浮动窗口阴影角落
hl(0, "TermCursor", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.white, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.white, })                  -- 终端中的光标

-- ----------------------------------------------------------------------------
-- 行号
-- ----------------------------------------------------------------------------
hl(0, "LineNr", { fg = vim.g.cls_gui.gray30, bg = "NONE",	ctermfg = vim.g.cls_cterm.gray30, ctermbg = "NONE",	bold = true, })       -- 行号
hl(0, "LineNrAbove", { fg = vim.g.cls_gui.gray30, bg = "NONE", ctermfg = vim.g.cls_cterm.gray30, ctermbg = "NONE", })                  -- 光标上方的相对行号
hl(0, "linenrbelow", { fg = vim.g.cls_gui.gray30, bg = "NONE", ctermfg = vim.g.cls_cterm.gray30, ctermbg = "none", })                  -- 光标下方的相对行号
hl(0, "CursorLineNr", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true, }) -- 光标行的行号

-- ----------------------------------------------------------------------------
-- 目录与快速修复
-- ----------------------------------------------------------------------------
hl(0, "Directory", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", })    -- 目录名
hl(0, "QuickFixLine", { bg = vim.g.cls_gui.gray_darker, ctermbg = vim.g.cls_cterm.gray_darker, bold = true, }) -- quickfix 窗口中的当前项

-- ----------------------------------------------------------------------------
-- 拼写检查
-- ----------------------------------------------------------------------------
hl(0, 'SpellBad', { bg = 'NONE', fg = vim.g.cls_gui.gray40, underline = true })   -- 拼写检查器无法识别的单词
hl(0, "SpellCap", { fg = vim.g.cls_gui.darkyellow, bg = "NONE", ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = "NONE", underline = true, })   -- 应以大写字母开头的单词
hl(0, "SpellLocal", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", underline = true, }) -- 在另一区域使用的单词
hl(0, "SpellRare", { fg = vim.g.cls_gui.keyword, bg = "NONE", ctermfg = vim.g.cls_cterm.keyword, ctermbg = "NONE", underline = true, })  -- 很少使用的单词

-- ----------------------------------------------------------------------------
-- 可视模式
-- ----------------------------------------------------------------------------
hl(0, "Visual", { fg = "NONE", bg = vim.g.cls_gui.gray25, ctermfg = "NONE", ctermbg = vim.g.cls_cterm.gray25, })    -- 可视模式选择
hl(0, "VisualNOS", { fg = "NONE", bg = vim.g.cls_gui.gray_dark, ctermfg = "NONE", ctermbg = vim.g.cls_cterm.gray_dark, }) -- Not Owning the Selection 时的可视模式

-- ----------------------------------------------------------------------------
-- 其他 Neovim 特有组
-- ----------------------------------------------------------------------------
hl(0, "Whitespace", { fg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.gray_dark, }) -- listchars 中的空白字符
hl(0, "SnippetTabstop", { bg = vim.g.cls_gui.gray_dark, ctermbg = vim.g.cls_cterm.gray_dark, }) -- 片段中的制表位
hl(0, "SnippetTabstopActive", { fg = vim.g.cls_gui.gray_darker, bg = vim.g.cls_gui.darkyellow, ctermfg = vim.g.cls_cterm.gray_darker, ctermbg = vim.g.cls_cterm.darkyellow, }) -- 片段中当前活动的制表位

-- ----------------------------------------------------------------------------
-- GUI 专用组（在 Neovim 中通常无效，仅作占位）
-- ----------------------------------------------------------------------------
hl(0, "TitleBar", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_dark, })   -- 活动窗口标题栏（仅 MS-Windows GUI）
hl(0, "TitleBarNC", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, }) -- 非活动窗口标题栏（仅 MS-Windows GUI）
hl(0, "Menu", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_dark, })       -- 菜单/工具栏
hl(0, "Scrollbar", { fg = vim.g.cls_gui.gray, bg = vim.g.cls_gui.gray_darker, ctermfg = vim.g.cls_cterm.gray, ctermbg = vim.g.cls_cterm.gray_darker, })  -- 滚动条
hl(0, "Tooltip", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.gray_dark, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_dark, })    -- 工具提示

-- ----------------------------------------------------------------------------
-- 用户自定义 HighLight
-- ----------------------------------------------------------------------------
hl(0, "User1", { fg = vim.g.cls_gui.error, bg = "NONE", ctermfg = vim.g.cls_cterm.error, ctermbg = "NONE", })
hl(0, "User2", { fg = vim.g.cls_gui.hint, bg = "NONE", ctermfg = vim.g.cls_cterm.hint, ctermbg = "NONE", })
hl(0, "User3", { fg = vim.g.cls_gui.darkyellow, bg = "NONE", ctermfg = vim.g.cls_cterm.darkyellow, ctermbg = "NONE", })
hl(0, "User4", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", })
hl(0, "User5", { fg = vim.g.cls_gui.keyword, bg = "NONE", ctermfg = vim.g.cls_cterm.keyword, ctermbg = "NONE", })
hl(0, "User6", { fg = vim.g.cls_gui.gray, bg = "NONE", ctermfg = vim.g.cls_cterm.gray, ctermbg = "NONE", })
hl(0, "User7", { fg = vim.g.cls_gui.white, bg = "NONE", ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", })
hl(0, "User8", { fg = vim.g.cls_gui.error, bg = "NONE", ctermfg = vim.g.cls_cterm.error, ctermbg = "NONE", })
hl(0, "User9", { fg = vim.g.cls_gui.hint, bg = "NONE", ctermfg = vim.g.cls_cterm.hint, ctermbg = "NONE", })






-- -- ----------------------------------------------------------------------------
-- -- 基础界面与光标
-- -- ----------------------------------------------------------------------------
-- hl(0, "Normal", { fg = cls_gui.gray70, bg = cls_gui.gray15, ctermfg = cls_cterm.gray70, ctermbg = cls_cterm.gray15, }) -- 普通文本 
-- hl(0, "Cursor", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, }) -- 光标下的字符 
-- hl(0, "lCursor", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, }) -- 语言映射时光标下的字符 
-- hl(0, "CursorIM", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, }) -- IME 模式下的光标 
-- hl(0, "CursorColumn", { bg = cls_gui.gray_darker, ctermbg = cls_cterm.gray_darker, }) -- 光标所在的屏幕列 
-- hl(0, "CursorLine", { bg = cls_gui.gray20, ctermbg = cls_cterm.gray20, }) -- 光标所在的屏幕行
-- hl(0, "ColorColumn", { bg = cls_gui.gray_darker, ctermbg = cls_cterm.gray_darker, }) -- colorcolumn 
-- hl(0, "Conceal", { fg = cls_gui.gray10, ctermfg = cls_cterm.gray10, }) -- 隐藏文本的占位符 
-- hl(0, "EndOfBuffer", { fg = cls_gui.gray_dark, ctermfg = cls_cterm.gray_dark, }) -- 缓冲区末尾的填充行 
-- hl(0, "NonText", { fg = cls_gui.gray10, ctermfg = cls_cterm.gray10, }) -- 不可见特殊字符 
-- hl(0, "SpecialKey", { fg = cls_gui.gray10, ctermfg = cls_cterm.gray10, }) -- 特殊键及空白字符

-- -- ----------------------------------------------------------------------------
-- -- 注释与语法
-- -- ----------------------------------------------------------------------------
-- hl(0, "vimComment", { fg = cls_gui.gray20, ctermfg = cls_cterm.gray20, bg = "NONE", italic = true, }) -- Vim Script 注释 
-- hl(0, "Comment", { fg = cls_gui.gray40, ctermfg = cls_cterm.gray40, bg = "NONE", italic = true, }) -- 通用注释

-- -- ----------------------------------------------------------------------------
-- -- 搜索与替换
-- -- ----------------------------------------------------------------------------
-- hl(0, "Search", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 上次搜索模式的高亮
-- hl(0, "CurSearch", { fg = cls_gui.gray_darker, bg = cls_gui.hint, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.hint, }) -- 当前搜索匹配
-- hl(0, "IncSearch", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 增量搜索高亮
-- hl(0, "MatchParen", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, underline = true, bold = true, }) -- 匹配的括号
-- hl(0, "Substitute", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })  -- :substitute 替换文本

-- -- ----------------------------------------------------------------------------
-- -- 差异模式 (Diff)
-- -- ----------------------------------------------------------------------------
-- hl(0, "DiffAdd", { fg = cls_gui.hint, bg = cls_gui.gray_darker, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.gray_darker, })     -- Diff 模式：新增的行
-- hl(0, "DiffChange", { fg = cls_gui.darkyellow, bg = cls_gui.gray_darker, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_darker, })  -- Diff 模式：改变的行
-- hl(0, "DiffDelete", { fg = cls_gui.error, bg = cls_gui.gray_darker, ctermfg = cls_cterm.error, ctermbg = cls_cterm.gray_darker, })  -- Diff 模式：删除的行
-- hl(0, "DiffText", { fg = cls_gui.darkyellow, bg = cls_gui.gray_dark, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_dark, })    -- Diff 模式：行内改变的文字
-- hl(0, "DiffTextAdd", { fg = cls_gui.hint, bg = cls_gui.gray_dark, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.gray_dark, }) -- Diff 模式：行内新增的文字

-- -- ----------------------------------------------------------------------------
-- -- 消息与命令行
-- -- ----------------------------------------------------------------------------
-- hl(0, "ErrorMsg", { fg = cls_gui.error, bg = "NONE", ctermfg = cls_cterm.error, ctermbg = "NONE", bold = true, }) -- 命令行上的错误消息
-- hl(0, "WarningMsg", { fg = cls_gui.warn, bg = "NONE", ctermfg = cls_cterm.warn, ctermbg = "NONE", })            -- 警告消息
-- hl(0, "ModeMsg", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", bold = true, })  -- showmode 消息
-- hl(0, "MsgArea", { fg = cls_gui.white, bg = cls_gui.gray15, ctermfg = cls_cterm.white, ctermbg = "NONE", })               -- 命令行区域
-- hl(0, "MoreMsg", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })               -- more-prompt
-- hl(0, "Question", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })              -- hit-enter 提示
-- hl(0, "Title", { fg = cls_gui.darkyellow, bg = "NONE", ctermfg = cls_cterm.darkyellow, ctermbg = "NONE", bold = true, })    -- :set all、:autocmd 等输出的标题
-- hl(0, "MessageWindow", { fg = cls_gui.darkyellow, bg = cls_gui.gray_dark, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_dark, })      -- :echowindow 使用的消息弹出窗口
-- hl(0, "OkMsg", { fg = cls_gui.hint, ctermfg = cls_cterm.hint, })                              -- 成功消息
-- hl(0, "StderrMsg", { fg = cls_gui.error, ctermfg = cls_cterm.error, })                          -- 标准错误消息
-- hl(0, "StdoutMsg", { fg = cls_gui.white, ctermfg = cls_cterm.white, })                          -- 标准输出消息
-- hl(0, "MsgSeparator", { fg = cls_gui.gray_dark, ctermfg = cls_cterm.gray_dark, })  -- 滚动消息的分隔符

-- -- ----------------------------------------------------------------------------
-- -- 弹出菜单与补全
-- -- ----------------------------------------------------------------------------
-- hl(0, "Pmenu", { fg = cls_gui.white, bg = cls_gui.gray20, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray20, })                      -- 弹出菜单：普通项
-- hl(0, "PmenuSel", { fg = cls_gui.gray_darker, bg = cls_gui.lightred, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.lightred, }) -- 弹出菜单：选中项
-- hl(0, "PmenuKind", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", })                  -- 弹出菜单：普通项的 kind
-- hl(0, "PmenuKindSel", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })               -- 弹出菜单：选中项的 kind
-- hl(0, "PmenuExtra", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                 -- 弹出菜单：普通项的额外文本
-- hl(0, "PmenuExtraSel", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })              -- 弹出菜单：选中项的额外文本
-- hl(0, "PmenuSbar", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                                  -- 弹出菜单：滚动条
-- hl(0, "PmenuThumb", { bg = cls_gui.gray, ctermbg = cls_cterm.gray, })                                 -- 弹出菜单：滚动条滑块
-- hl(0, "PmenuMatch", { fg = cls_gui.hint, bg = cls_gui.gray_darker, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.gray_darker, bold = true, })    -- 弹出菜单：普通项中的匹配文本
-- hl(0, "PmenuMatchSel", { fg = cls_gui.hint, bg = cls_gui.darkyellow, ctermfg = cls_cterm.hint, ctermbg = cls_cterm.darkyellow, bold = true, }) -- 弹出菜单：选中项中的匹配文本
-- hl(0, "PmenuBorder", { fg = cls_gui.gray_dark, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray_dark, ctermbg = cls_cterm.gray_darker, })                -- 弹出菜单：边框字符
-- hl(0, "PmenuShadow", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                                -- 弹出菜单：阴影
-- hl(0, "PmenuShadowThrough", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                         -- 弹出菜单：阴影角落
-- hl(0, "ComplMatchIns", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", bold = true, })    -- 当前插入的补全匹配文本
-- hl(0, "PreInsert", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                     -- preinsert 插入的文本
-- hl(0, "PopupSelected", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })              -- popup_menu() 弹出窗口
-- hl(0, "PopupNotification", { fg = cls_gui.darkyellow, bg = cls_gui.gray_darker, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_darker, })          -- popup_notification() 弹出窗口
-- hl(0, "WildMenu", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, })                   -- wildmenu 补全中的当前匹配
-- hl(0, "ComplHint", { fg = cls_gui.gray, ctermfg = cls_cterm.gray, })                                  -- 当前补全的虚拟文本
-- hl(0, "ComplHintMore", { fg = cls_gui.link, ctermfg = cls_cterm.link, })                              -- 补全虚拟文本的附加信息

-- -- ----------------------------------------------------------------------------
-- -- 状态栏、标签页与窗口
-- -- ----------------------------------------------------------------------------
-- hl(0, "StatusLine", { fg = cls_gui.gray80, bg = cls_gui.gray10, ctermfg = cls_cterm.gray80, ctermbg = cls_cterm.gray10, bold = true, })        -- 当前窗口的状态行
-- hl(0, "StatusLineNC", { fg = cls_gui.darkyellow, bg = cls_gui.gray_dark, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_dark, })                -- 非当前窗口的状态行
-- hl(0, "StatusLineTerm", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, bold = true, }) -- 当前终端窗口的状态行
-- hl(0, "StatusLineTermNC", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })            -- 非当前终端窗口的状态行
-- hl(0, "VertSplit", { fg = cls_gui.gray_dark, bg = "NONE", ctermfg = cls_cterm.gray_dark, ctermbg = "NONE", })                      -- 垂直分割窗口的分隔列（旧名）
-- hl(0, "WinSeparator", { fg = cls_gui.gray_dark, bg = "NONE", ctermfg = cls_cterm.gray_dark, ctermbg = "NONE", })                   -- 窗口分隔符（Neovim 新名）
-- hl(0, "TabLineFill", { fg = cls_gui.gray90, bg = cls_gui.gray10, ctermfg = cls_cterm.gray90, ctermbg = cls_cterm.gray10, bold = true, })       -- 标签页行：没有标签的地方
-- hl(0, "TabLine", { fg = cls_gui.gray50, bg = cls_gui.gray20, ctermfg = cls_cterm.gray50, ctermbg = cls_cterm.gray20, })                        -- 标签页行：非活动标签页标签
-- hl(0, "TabLineSel", { fg = cls_gui.gray5, bg = cls_gui.lightred, ctermfg = cls_cterm.gray5, ctermbg = cls_cterm.lightred, bold = true, })     -- 标签页行：活动标签页标签
-- hl(0, "TabPanel", { fg = cls_gui.gray, bg = cls_gui.gray_dark, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_dark, })                    -- TabPanel：非活动标签页标签
-- hl(0, "TabPanelFill", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                -- TabPanel：没有标签的地方
-- hl(0, "TabPanelSel", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, bold = true, })    -- TabPanel：活动标签页标签
-- hl(0, "Terminal", { fg = cls_gui.white, bg = "NONE", ctermfg = cls_cterm.white, ctermbg = "NONE", })                       -- terminal 窗口
-- hl(0, "SignColumn", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                     -- 显示 signs 的列
-- hl(0, "Folded", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                      -- 关闭折行使用的行
-- hl(0, "FoldColumn", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                     -- foldcolumn
-- hl(0, "CursorLineFold", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                 -- 光标行的折叠列
-- hl(0, "CursorLineSign", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })                 -- 光标行的符号列
-- hl(0, "WinBar", { fg = cls_gui.white, bg = cls_gui.gray_darker, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_darker, bold = true, })         -- 当前窗口的窗口栏
-- hl(0, "WinBarNC", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                    -- 非当前窗口的窗口栏
-- hl(0, "NormalNC", { fg = cls_gui.white, bg = cls_gui.black, ctermfg = cls_cterm.white, ctermbg = cls_cterm.black, })                    -- 非当前窗口的普通文本
-- hl(0, "NormalFloat", { fg = cls_gui.white, bg = cls_gui.gray_darker, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_darker, })  -- 浮动窗口的普通文本
-- hl(0, "FloatBorder", { fg = cls_gui.gray_dark, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray_dark, ctermbg = cls_cterm.gray_darker, })                 -- 浮动窗口边框
-- hl(0, "FloatTitle", { fg = cls_gui.darkyellow, bg = cls_gui.gray_darker, ctermfg = cls_cterm.darkyellow, ctermbg = cls_cterm.gray_darker, bold = true, })     -- 浮动窗口标题
-- hl(0, "FloatFooter", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })                 -- 浮动窗口页脚
-- hl(0, "FloatShadow", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                                 -- 浮动窗口阴影
-- hl(0, "FloatShadowThrough", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, })                          -- 浮动窗口阴影角落
-- hl(0, "TermCursor", { fg = cls_gui.gray_darker, bg = cls_gui.white, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.white, })                  -- 终端中的光标

-- -- ----------------------------------------------------------------------------
-- -- 行号
-- -- ----------------------------------------------------------------------------
-- hl(0, "LineNr", { fg = cls_gui.gray30, bg = "NONE",	ctermfg = cls_cterm.gray30, ctermbg = "NONE",	bold = true, })       -- 行号
-- hl(0, "LineNrAbove", { fg = cls_gui.gray30, bg = "NONE", ctermfg = cls_cterm.gray30, ctermbg = "NONE", })                  -- 光标上方的相对行号
-- hl(0, "linenrbelow", { fg = cls_gui.gray30, bg = "NONE", ctermfg = cls_cterm.gray30, ctermbg = "none", })                  -- 光标下方的相对行号
-- hl(0, "CursorLineNr", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", bold = true, }) -- 光标行的行号

-- -- ----------------------------------------------------------------------------
-- -- 目录与快速修复
-- -- ----------------------------------------------------------------------------
-- hl(0, "Directory", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", })    -- 目录名
-- hl(0, "QuickFixLine", { bg = cls_gui.gray_darker, ctermbg = cls_cterm.gray_darker, bold = true, }) -- quickfix 窗口中的当前项

-- -- ----------------------------------------------------------------------------
-- -- 拼写检查
-- -- ----------------------------------------------------------------------------
-- hl(0, 'SpellBad', { bg = 'NONE', fg = cls_gui.gray40, underline = true })   -- 拼写检查器无法识别的单词
-- hl(0, "SpellCap", { fg = cls_gui.darkyellow, bg = "NONE", ctermfg = cls_cterm.darkyellow, ctermbg = "NONE", underline = true, })   -- 应以大写字母开头的单词
-- hl(0, "SpellLocal", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", underline = true, }) -- 在另一区域使用的单词
-- hl(0, "SpellRare", { fg = cls_gui.keyword, bg = "NONE", ctermfg = cls_cterm.keyword, ctermbg = "NONE", underline = true, })  -- 很少使用的单词

-- -- ----------------------------------------------------------------------------
-- -- 可视模式
-- -- ----------------------------------------------------------------------------
-- hl(0, "Visual", { fg = "NONE", bg = cls_gui.gray25, ctermfg = "NONE", ctermbg = cls_cterm.gray25, })    -- 可视模式选择
-- hl(0, "VisualNOS", { fg = "NONE", bg = cls_gui.gray_dark, ctermfg = "NONE", ctermbg = cls_cterm.gray_dark, }) -- Not Owning the Selection 时的可视模式

-- -- ----------------------------------------------------------------------------
-- -- 其他 Neovim 特有组
-- -- ----------------------------------------------------------------------------
-- hl(0, "Whitespace", { fg = cls_gui.gray_dark, ctermfg = cls_cterm.gray_dark, }) -- listchars 中的空白字符
-- hl(0, "SnippetTabstop", { bg = cls_gui.gray_dark, ctermbg = cls_cterm.gray_dark, }) -- 片段中的制表位
-- hl(0, "SnippetTabstopActive", { fg = cls_gui.gray_darker, bg = cls_gui.darkyellow, ctermfg = cls_cterm.gray_darker, ctermbg = cls_cterm.darkyellow, }) -- 片段中当前活动的制表位

-- -- ----------------------------------------------------------------------------
-- -- GUI 专用组（在 Neovim 中通常无效，仅作占位）
-- -- ----------------------------------------------------------------------------
-- hl(0, "TitleBar", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })   -- 活动窗口标题栏（仅 MS-Windows GUI）
-- hl(0, "TitleBarNC", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, }) -- 非活动窗口标题栏（仅 MS-Windows GUI）
-- hl(0, "Menu", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })       -- 菜单/工具栏
-- hl(0, "Scrollbar", { fg = cls_gui.gray, bg = cls_gui.gray_darker, ctermfg = cls_cterm.gray, ctermbg = cls_cterm.gray_darker, })  -- 滚动条
-- hl(0, "Tooltip", { fg = cls_gui.white, bg = cls_gui.gray_dark, ctermfg = cls_cterm.white, ctermbg = cls_cterm.gray_dark, })    -- 工具提示

-- -- ----------------------------------------------------------------------------
-- -- 用户自定义 HighLight
-- -- ----------------------------------------------------------------------------
-- hl(0, "User1", { fg = cls_gui.error, bg = "NONE", ctermfg = cls_cterm.error, ctermbg = "NONE", })
-- hl(0, "User2", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })
-- hl(0, "User3", { fg = cls_gui.darkyellow, bg = "NONE", ctermfg = cls_cterm.darkyellow, ctermbg = "NONE", })
-- hl(0, "User4", { fg = cls_gui.link, bg = "NONE", ctermfg = cls_cterm.link, ctermbg = "NONE", })
-- hl(0, "User5", { fg = cls_gui.keyword, bg = "NONE", ctermfg = cls_cterm.keyword, ctermbg = "NONE", })
-- hl(0, "User6", { fg = cls_gui.gray, bg = "NONE", ctermfg = cls_cterm.gray, ctermbg = "NONE", })
-- hl(0, "User7", { fg = cls_gui.white, bg = "NONE", ctermfg = cls_cterm.white, ctermbg = "NONE", })
-- hl(0, "User8", { fg = cls_gui.error, bg = "NONE", ctermfg = cls_cterm.error, ctermbg = "NONE", })
-- hl(0, "User9", { fg = cls_gui.hint, bg = "NONE", ctermfg = cls_cterm.hint, ctermbg = "NONE", })

