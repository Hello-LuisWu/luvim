local opt = vim.opt

-- ----------------------------
-- 界面与显示
-- ----------------------------

-- vim.cmd.colorscheme('catppuccin') -- 主题设置
opt.relativenumber = true         -- 相对行号
opt.number = true                 -- 显示行号
opt.helplang = "cn"               -- 帮助文件所使用的语言
opt.numberwidth = 4               -- 行号宽度设置为4个字符
opt.termguicolors = false          -- 启用 24 bit 彩色模式
opt.cursorline = true             -- 高亮光标所在行
opt.cursorcolumn = false          -- 禁止高亮光标所在列
opt.signcolumn = "yes"            -- 始终显示左侧标记列,行号前面多出一列,用于插件提示
opt.showmode = true               -- 是否在命令行显示当前模式
opt.title = true                  -- 在终端标题栏显示当前文件名
opt.wrap = false                  -- 不自动换行, 用 <leader>enter 切换
opt.linebreak = true              -- 不在单词内部换行(需开启自动换行 ),
opt.breakindent = true            -- 换行后的行保持缩进
opt.scrolloff = 3                 -- 上下滚动时光标离窗口上下边界 3 行
opt.sidescrolloff = 8             -- 左右移动时，光标距离窗口边缘保持 8 个字符
opt.whichwrap = "b,s,<,>,[,],h,l" -- 左右键 h/l 可以跨行移动。
opt.textwidth = 50
-- opt.colorcolumn = "33,22,11"        -- 右边添加参考线
opt.showmatch = true -- 匹配括号高亮
opt.matchtime = 2    -- 匹配括号高亮持续时间（十分之一秒）
opt.pumheight = 10   -- 弹出菜单最多显示10行
opt.cmdheight = 1    -- 命令行高度

opt.ruler = true -- 右下角显示光标行列位置（默认 true）
opt.showbreak = "↳ " -- 自动换行时的行首符号
opt.shortmess:append("I") -- 关闭启动画面
opt.shortmess:append("c") -- 减少显示补全提示信息, 使用 blink.cmp，这个属于可选项。
opt.more = false -- 关掉分页提示 "More"
opt.report = 2 -- 修改多少行后提示
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- 不同模式光标形状（终端需支持）
opt.background = "dark" -- 主题插件会自行设置

vim.api.nvim_set_hl(0, "MatchParen", {
	bg = "#fabd2f",
	bold = true,
	underline = true,
})

opt.showcmd = false -- 显示输入的命令
opt.list = false    -- 显示不可见字符
opt.listchars = {   -- 设置不可见字符的显示方式
	tab = "| ",
	trail = "·",
	nbsp = "␣",
	extends = "›", -- extends / precedes 用于提示一行内容在窗口左右还有隐藏内容。
	precedes = "‹",
}
opt.fillchars = {
	horiz = "━", -- 水平分割线（上下窗口分隔）
	horizup = "┻", -- 水平分割线顶部（仅 Neovim 0.10+）
	horizdown = "┳", -- 下部分水平分割线
	vert = "┃", -- 垂直分割线
	vertleft = "┫", -- 左边垂直分割线
	vertright = "┣", -- 右边垂直分割线
	verthoriz = "╋", -- 交叉分割线
	foldopen = "",
	foldclose = "",
	fold = " ", -- 折叠的填充字符（默认：.）
	foldsep = " ", -- 折叠间的分隔符
	-- msgsep = "‾", -- 消息分隔线
	eob = " ", -- 文件末尾空白行的提示符（默认是 "~"）
	stl = " ", -- 状态栏左侧填充
	diff = "⣿", -- `diff` 模式下的填充字符
	stlnc = " ", -- 非当前窗口状态栏填充
}

-- -- ----------------------------
-- -- 编辑体验
-- -- ----------------------------

-- -- 关于缩进
local Itn = 4                                                  -- 缩进宽度
opt.tabstop = Itn                                              -- 统一控制 Tab、自动缩进以及软 Tab 占几个空格
opt.shiftwidth = Itn                                           -- >>、<< 以及自动缩进都会按照这个值进行 设为 0 时会取 indent 的值
opt.softtabstop = Itn                                          -- 插入模式下按 Tab/Backspace 时使用的缩进宽度, 设为 0 时会使用 shiftwidth 的值
opt.shiftround = true                                          -- 缩进时将缩进量取整到 shiftwidth 的倍数
opt.expandtab = false                                          -- 使用空格替代 tab , 将 Tab 转换为空格
opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- 启用基于语法树的缩进（由 nvim-treesitter 提供）
-- opt.autoindent = true                                          -- 自动继承上一行的缩进,与 indentexpr 冲突
-- opt.cindent = true                                             -- 启用C语言风格缩进, 与 indentexpr 冲突
-- opt.smartindent = true                                       -- 开启新行时使用智能缩进（如 C 语言风格的代码块）, 与 indentexpr 冲突
-- opt.smarttab = true                                            -- 智能使用 tabstop 和 shiftwidth

-- -- 需设置 cindent = true, 与 treesitter 相冲突
-- -- vim.opt.cinkeys = "0{,0},0),:,!^F,o,O,e" -- 触发缩进的字符,
-- -- vim.opt.cinoptions = "g0,h1,N-s"         -- 缩进细节（如 `g0` 控制作用域声明缩进）

-- opt.mouse = "a"                          -- 启用鼠标
opt.mouse = "" -- 禁用鼠标
-- "extend": 右键用于扩展当前选区，而不是弹出上下文菜单;
-- "popup": 右键弹出菜单;
-- "popup_setpos": 右键弹出菜单并定位到鼠标位置
-- opt.mousemodel = "extend"   -- 禁用鼠标后无需设置


vim.schedule(function()
	opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- 共享系统剪贴板
end)

opt.smoothscroll = true                            -- Neovim 0.10+ 平滑滚动
opt.autochdir = false                              -- 自动切换当前目录为当前文件所在的目录
opt.completeopt = "menu,menuone,noselect,noinsert" -- 补全菜单行为：显示菜单，即使只有一个选项，不自动选择
opt.wildmenu = true                                -- 命令行 Tab 补全时使用完整菜单
opt.wildmode = "longest:full,full"                                -- 命令行补全模式
opt.virtualedit = "block,onemore"                  -- 光标可以定位到最后一个字的后面
opt.backspace = { "start", "eol", "indent" }       -- 正常删除
-- opt.joinspaces = false -- 句号后是否自动加入两个空格。

-- 备份和撤销
opt.backup = false      -- 禁用备份文件
opt.writebackup = false -- 禁用写入文件前的备份
opt.swapfile = false    -- 禁用交换文件
opt.undofile = false    -- 禁用撤销文件
opt.undolevels = 10000  -- 设置撤销级别
-- vim.o.backupdir = "~/.config/nvim/backup//" -- 设置备份文件存储路径
-- vim.o.directory = "~/.config/nvim/swap//"   -- 设置交换文件存储路径
-- vim.o.undodir = "~/.config/nvim/undo//"     -- 设置撤销文件存储路径
opt.history = 1000 -- 命令历史和搜索历史的最大记录条数

-- -- ----------------------------
-- -- 搜索与替换
-- -- ----------------------------
opt.hlsearch = true                       -- 开启搜索高亮
opt.incsearch = true                      -- 搜索逐字高亮
opt.ignorecase = true                     -- 搜索忽略大小写
opt.smartcase = true                      -- 如果包含大写字母，则进行大小写敏感搜索
opt.inccommand = "split"                  -- 实时预览替换效果（输入 :%s/foo/bar 时）
opt.grepprg = "rg --vimgrep --smart-case" -- 使用 ripgrep 作为 :grep 的搜索工具, 要安装 ripgrep
opt.grepformat = "%f:%l:%c:%m"            -- 解析 rg --vimgrep 的输出格式

-- -- ----------------------------
-- -- 文件与缓冲区
-- -- ----------------------------
opt.modifiable = true -- 确保缓冲区可修改
opt.hidden = true     -- 允许隐藏被修改的缓冲区（切换文件时不强制保存）
opt.autoread = true   -- 当文件被外部程序修改时自动重新加载
opt.autowrite = true  -- 在切换缓冲区或执行某些命令时自动保存
opt.confirm = true    -- 退出时文件没保存,会问你是否保存
-- vim.filetype.add({ extension = { ... } })          -- 启用文件类型检测, Neovim 0.10+
-- opt.encoding = "utf-8"                 -- 设置 Neovim 内部编码, Neovim 0.9+ 已废弃。
-- opt.fileencoding = "utf-8"             -- 自动检测文件编码的顺序
opt.fileencodings = "utf-8,gbk,latin1" -- 自动检测文件编码的顺序
vim.scriptencoding = "utf-8"           -- 脚本文件所使用的编码
opt.fileformats = "unix,dos,mac"       -- 文件格式支持，优先次序从左到右
-- opt.fileformat = "unix"                -- 文件格式支持，优先次序从左到右

-- -- ----------------------------
-- -- 窗口与布局
-- -- ----------------------------
opt.splitbelow = true    -- 新的水平分屏窗口在下方打开
opt.splitright = true    -- 新的垂直分屏窗口在右侧打开
opt.splitkeep = "screen" -- 保持屏幕不动
-- 设置浮动窗口混合效果 (增强透明感)
-- opt.winblend = 15         -- 窗口透明度, 0-100值越高越透明
-- opt.pumblend = 15         -- 补全菜单透明度
opt.equalalways = false -- 不自动调整窗口大小相等（若需启用设为 true）

-- -- ----------------------------
-- -- 性能优化
-- -- ----------------------------
opt.updatetime = 300 -- 等待用户停止输入后，触发 CursorHold、诊断等事件的间隔
-- opt.timeout = true -- 启用映射/按键序列的超时机制。默认值
opt.timeoutlen = 300 -- 输入多键映射时，最多等待 300ms。
-- opt.lazyredraw = false -- 执行宏或未映射的快捷键时减少重绘（提升性能）,开启可能会导致插件报错
-- opt.synmaxcol = 240    -- 语法高亮的最大列数，超过则跳过, 使用 Tree-sitter，可以考虑删除。

-- 启用代码折叠
opt.foldenable = true                            -- 开启折叠
opt.foldmethod = 'expr'                          -- 指定折叠方式
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- 基于 treesitter 的折叠
opt.foldcolumn = "0"                             -- 1为在编辑器左侧显示折叠标记的列, 0 为不显示
opt.foldlevel = 99                               -- 一次折叠的层级有多少
opt.foldlevelstart = 99                          -- 打开文件时的默认折叠层级,
-- 自定义折叠文本
function _G.foldtext()
	local line = vim.fn.getline(vim.v.foldstart)
	local lines = vim.v.foldend - vim.v.foldstart + 1
	return "> " .. line .. " 折叠了 " .. lines .. " 行"
end

opt.foldtext = "v:lua.foldtext()"
-- opt.foldtext = 'v:lua.vim.treesitter.foldtext()' -- 自定义折叠行显示内容

-- -- ----------------------------
-- -- 其他杂项
-- -- ----------------------------
opt.shell = vim.env.SHELL or "/bin/sh"                                            -- 执行外部命令时使用的 Shell,如: :terminal  :!ls :!git status
vim.cmd("filetype plugin indent on")
opt.spell = false                                                 -- 禁止拼写支持
opt.spelllang = { "en_us", "cjk" }                                -- 设置拼写检查语言
opt.spelloptions = "camel"                                        -- 驼峰单词分段拼写检测（比如helloWorld拆成hello+world）
opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add" -- 自定义拼写词典文件路径




-- opt.cscopequickfix = "s-,c-,d-,i-,t-,e-"


-- opt.path:append({ "**" }) -- :find xxx  会搜索子目录。
-- opt.wildignore:append({ "*/node_modules/*" }) -- 完全使用 fzf-lua / Snacks picker，则重要性下降。
-- opt.formatoptions:append({ "r" })  -- 换行延续注释
