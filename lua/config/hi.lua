local vim  = vim
local hl = vim.api.nvim_set_hl
local gui = vim.g.cls_gui
local cterm = vim.g.cls_cterm



-- ----------------------------------------------------------------------------
-- 基础界面与光标
-- ----------------------------------------------------------------------------
hl(0, "Normal", { fg = vim.g.cls_gui.white, bg = vim.g.cls_gui.black, ctermfg = vim.g.cls_cterm.gray70, ctermbg = vim.g.cls_cterm.black, }) -- 普通文本 
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
hl(0, "TabLine", { fg = vim.g.cls_gui.gray60, bg = vim.g.cls_gui.gray30, ctermfg = vim.g.cls_cterm.gray50, ctermbg = vim.g.cls_cterm.gray20, })                        -- 标签页行：非活动标签页标签
hl(0, "TabLineSel", { fg = vim.g.cls_gui.black, bg = vim.g.cls_gui.gray65, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.link, bold = true, })     -- 标签页行：活动标签页标签
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
hl(0, "NormalFloat", { fg = vim.g.cls_gui.gray60, bg = vim.g.cls_gui.gray20, ctermfg = vim.g.cls_cterm.white, ctermbg = vim.g.cls_cterm.gray_darker, })  -- 浮动窗口的普通文本
hl(0, "FloatBorder", { fg = vim.g.cls_gui.gray40, bg = vim.g.cls_gui.gray20, ctermfg = vim.g.cls_cterm.gray_dark, ctermbg = vim.g.cls_cterm.gray_darker, })                 -- 浮动窗口边框
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

-- Markdown 标题：一级到六级

-- ============================================================
-- Markdown Tree-sitter Highlights
-- Style: OneDark-inspired
-- Colors: vim.g.cls_gui / vim.g.cls_cterm
-- ============================================================

-- ------------------------------------------------------------
-- 通用高亮设置函数
-- 同时配置 GUI 与终端颜色
-- ------------------------------------------------------------

local function set_hl(group, opts)
    hl(0, group, opts)
end

local function set_color(group, fg, opts)
    opts = opts or {}

    if fg then
        opts.fg = gui[fg]
        opts.ctermfg = cterm[fg]
    end

    set_hl(group, opts)
end

local function set_bg(group, fg, bg, opts)
    opts = opts or {}

    if fg then
        opts.fg = gui[fg]
        opts.ctermfg = cterm[fg]
    end

    if bg then
        opts.bg = gui[bg]
        opts.ctermbg = cterm[bg]
    end

    set_hl(group, opts)
end


-- ============================================================
-- 1. 标题
-- ============================================================

hl(0, "@markup.heading", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true }) -- 通用标题：作为未指定层级时的回退样式
hl(0, "@markup.heading.1", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true})
hl(0, "@markup.heading.2", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true})
hl(0, "@markup.heading.3", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true})
hl(0, "@markup.heading.4", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true})
hl(0, "@markup.heading.5", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true})
hl(0, "@markup.heading.6", { fg = vim.g.cls_gui.link, bg = "NONE", ctermfg = vim.g.cls_cterm.link, ctermbg = "NONE", bold = true})
-- set_color("@markup.heading", "white", { bold = true })
-- set_color("@markup.heading.1", "white", { bold = true })
-- set_color("@markup.heading.2", "white", { bold = true })
-- set_color("@markup.heading.3", "white", { bold = true })
-- set_color("@markup.heading.4", "white", { bold = true })
-- set_color("@markup.heading.5", "white", { bold = true })
-- set_color("@markup.heading.6", "white", { bold = true })

-- ============================================================
-- 2. 文本格式
-- ============================================================
hl(0, "@markup.strong", { fg = vim.g.cls_gui.white, bg = "NONE", ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", bold = true}) -- 粗体
hl(0, "@markup.italic", { fg = vim.g.cls_gui.white, bg = "NONE", ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", italic = true}) -- 斜体
hl(0, "@markup.strikethrough", { fg = vim.g.cls_gui.white, bg = "NONE", ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", strikethrough = true}) -- 删除线
hl(0, "@markup.underline", { fg = vim.g.cls_gui.white, bg = "NONE", ctermfg = vim.g.cls_cterm.white, ctermbg = "NONE", underline = true}) -- 下划线
-- set_color("@markup.strong", "white", { bold = true })  -- 粗体
-- set_color("@markup.italic", "lightblue", { italic = true })  -- 斜体
-- set_color("@markup.strikethrough", "gray", { strikethrough = true }) 
-- set_color("@markup.underline", "link", { underline = true }) -- 下划线

-- ============================================================
-- 3. 行内代码与代码块
-- ============================================================
hl(0, "@markup.raw", { fg = vim.g.cls_gui.gray60, ctermfg = vim.g.cls_cterm.gray60, bold = false}) -- 行内原始文本 / 行内代码
hl(0, "@markup.raw.block", { fg = vim.g.cls_gui.link, ctermfg = vim.g.cls_cterm.link, bold = false})  -- 围栏代码块
hl(0, "@markup.math", { fg = vim.g.cls_gui.lightpurple, ctermfg = vim.g.cls_cterm.lightpurple, italic = true})  -- 数学公式

-- set_bg("@markup.raw", "hint", "gray_darker", { bold = false }) -- 行内原始文本 / 行内代码
-- set_bg("@markup.raw.block", "white", "black", { bold = false }) -- 围栏代码块
-- set_color("@markup.math", "lightpurple", { italic = true }) -- 数学公式

-- ============================================================
-- 4. 链接
-- ============================================================
hl(0, "@markup.link", { fg = vim.g.cls_gui.link, ctermfg = vim.g.cls_cterm.link })   -- 通用链接
hl(0, "@markup.link.label", { fg = vim.g.cls_gui.link, ctermfg = vim.g.cls_cterm.link })  -- 链接标签 / 引用标签
hl(0, "@markup.link.url", { fg = vim.g.cls_gui.info, ctermfg = vim.g.cls_cterm.info, underline = true})    -- URL 地址
hl(0, "@markup.link.title", { fg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.hint, italic = true})    -- 链接标题

-- set_color("@markup.link", "link", {}) -- 通用链接
-- set_color("@markup.link.label", "link", {}) -- 链接标签 / 引用标签
-- set_color("@markup.link.url", "info", { underline = true }) -- URL 地址
-- set_color("@markup.link.title", "hint", { italic = true }) -- 链接标题

-- ============================================================
-- 5. 引用与列表
-- ============================================================
hl(0, "@markup.quote", { fg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.hint, italic = true }) -- 引用块
hl(0, "@markup.list", { fg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.hint, bold = true }) -- 列表标记
hl(0, "@markup.list.checked", { fg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.hint, bold = true }) -- 已勾选任务
hl(0, "@markup.list.unchecked", { fg = vim.g.cls_gui.hint, ctermfg = vim.g.cls_cterm.hint }) -- 未勾选任务

-- set_color("@markup.quote", "gray_light", { italic = true }) -- 引用块
-- set_color("@markup.list", "orange", { bold = true }) -- 列表标记
-- set_color("@markup.list.checked", "hint", { bold = true }) -- 已勾选任务
-- set_color("@markup.list.unchecked", "gray", {}) -- 未勾选任务

-- ============================================================
-- 6. 标点符号
-- ============================================================
set_color("@punctuation.special", "gray_light", {}) -- 特殊标点：例如部分 Markdown 语法标记
set_color("@punctuation.delimiter", "gray", {}) -- 普通分隔符

-- ============================================================
-- 7. 代码围栏标签 / 元数据 / 转义
-- ============================================================
set_color("@label", "cyan", { bold = true }) -- 语言标识等标签
set_color("@keyword.directive", "keyword", { bold = true }) -- YAML 元数据指令
set_color("@string.escape", "orange", { bold = true }) -- 转义序列

-- ============================================================
-- 8. 拼写检查
-- ============================================================
-- 拼写检查文本不强制覆盖前景色，
-- 保留底层文字颜色，仅设置拼写提示下划线样式。
-- set_hl("@spell", {
--     undercurl = true,
--     sp = gui.warn,
-- })
