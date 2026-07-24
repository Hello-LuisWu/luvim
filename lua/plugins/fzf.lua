vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua"
})

local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        fullscreen = true,
        treesitter = {
            enabled = true, -- 启用 Treesitter 语法高亮

            fzf_colors = {
                ["hl"] = "-1:reverse", -- 普通匹配结果高亮颜色
                ["hl+"] = "-1:reverse" -- 当前选中结果高亮颜色
            },
        },
        preview = {

            border = "rounded", -- 预览窗口边框样式
            -- 支持 nvim_open_win 的边框样式
            -- 也支持 fzf 原生边框，例如：
            -- "border-top"
            -- "none"

            -- 原生预览器（bat/cat/git 等）
            -- 也可以通过函数动态设置：
            -- border = function(winopts, metadata)

            wrap = false, -- 是否开启预览内容自动换行
            -- true  = 自动换行
            -- false = 不换行

            hidden = false, -- 是否默认隐藏预览窗口
            -- true  = 隐藏
            -- false = 显示

            vertical = "down:45%", -- 垂直布局时：
            -- 预览窗口显示在下面
            -- 占整个窗口高度 45%

            horizontal = "right:60%", -- 水平布局时：
            -- 预览窗口显示在右侧
            -- 占整个窗口宽度 60%

            layout = "flex", -- 预览布局方式
            -- horizontal = 始终左右布局
            -- vertical   = 始终上下布局
            -- flex       = 自动根据窗口宽度切换

            flip_columns = 100, -- flex 模式切换阈值
            -- 当窗口宽度小于 100 列：
            -- 使用上下布局
            --
            -- 当窗口宽度大于 100 列：
            -- 使用左右布局

            title = true, -- 是否显示预览窗口标题
            -- 标题显示当前文件名

            title_pos = "center", -- 标题位置
            -- left    = 左
            -- center  = 中
            -- right   = 右

            scrollbar = "float", -- 预览窗口滚动条样式
            -- false   = 不显示
            -- float   = 浮动滚动条
            -- border  = 使用边框滚动条

            scrolloff = -1, -- 滚动条距离右侧边缘的位置
            -- 只对 scrollbar="float" 有效

            delay = 20, -- 预览延迟时间（毫秒）
            -- 防止快速移动选择时频繁刷新导致卡顿

            winopts = {                 -- 内置预览器窗口配置
                number = true,          -- 显示行号
                relativenumber = false, -- 是否显示相对行号
                cursorline = true,      -- 高亮当前光标所在行
                cursorlineopt = "both", -- 光标行高亮范围
                -- both = 行和列

                cursorcolumn = false, -- 是否高亮当前光标所在列

                signcolumn = "no",    -- 是否显示符号列
                -- no = 不显示（关闭 git/lsp 标记）

                list = false, -- 是否显示不可见字符
                -- false = 不显示

                foldenable = false,    -- 禁用代码折叠

                foldmethod = "manual", -- 折叠方式
                -- manual = 手动折叠
            },
        },

    },

    keymap = {

        -- fzf-lua 内置窗口快捷键
        -- 这里的按键会覆盖默认设置
        --
        -- 如果想继承官方默认全部快捷键：
        -- builtin = true
        --
        -- 然后只修改需要改变的按键


        builtin = {
            -- Neovim :tmap 映射
            -- 作用于 fzf-lua 浮动窗口

            ["<M-Esc>"] = "hide",
            -- 隐藏当前 fzf-lua 窗口
            -- 可以使用 :FzfLua resume 恢复

            ["<F1>"] = "toggle-help",
            -- 显示/隐藏 fzf-lua 帮助信息

            ["<F2>"] = "toggle-fullscreen",
            -- 切换全屏模式
            -- 浮动窗口 ↔ 全屏窗口

            -- 以下快捷键只对 builtin 预览器有效

            ["<F3>"] = "toggle-preview-wrap",
            -- 开启/关闭预览内容自动换行

            ["<F4>"] = "toggle-preview",
            -- 显示/隐藏代码预览窗口

            ["<F5>"] = "toggle-preview-cw",
            -- 顺时针旋转预览窗口方向
            -- 可在上下/左右布局之间切换

            ["<F6>"] = "toggle-preview-behavior",
            -- 切换预览行为模式
            -- 默认模式 / 扩展模式

            -- 以下功能需要安装：
            -- nvim-treesitter-context

            ["<F7>"] = "toggle-preview-ts-ctx",
            -- 开启/关闭 Treesitter 上下文显示
            -- 显示当前函数、类等上下文

            ["<F8>"] = "preview-ts-ctx-dec",
            -- 减少 Treesitter 上下文显示范围

            ["<F9>"] = "preview-ts-ctx-inc",
            -- 增加 Treesitter 上下文显示范围

            ["<S-Left>"] = "preview-reset",
            -- 重置预览窗口滚动位置

            ["<S-down>"] = "preview-page-down",
            -- 预览窗口向下翻页

            ["<S-up>"] = "preview-page-up",
            -- 预览窗口向上翻页

            ["<M-S-down>"] = "preview-down",
            -- 向下滚动预览内容

            ["<M-S-up>"] = "preview-up",
            -- 向上滚动预览内容

        },

        --------------------------------------------------
        -- fzf 原生快捷键
        -- 等价于 fzf --bind=
        --------------------------------------------------
        fzf = {
            ["ctrl-z"] = "abort",
            -- 退出当前 fzf 搜索

            ["ctrl-u"] = "unix-line-discard",
            -- 删除当前输入行内容

            ["ctrl-f"] = "half-page-down",
            -- fzf 列表向下翻半页

            ["ctrl-b"] = "half-page-up",
            -- fzf 列表向上翻半页

            ["ctrl-a"] = "beginning-of-line",
            -- 光标移动到输入框开头

            ["ctrl-e"] = "end-of-line",
            -- 光标移动到输入框结尾

            ["alt-a"] = "toggle-all",
            -- 全选/取消全部选择

            ["alt-g"] = "first",
            -- 跳转到第一项

            ["alt-G"] = "last",
            -- 跳转到最后一项

            -- 以下只对 fzf 外部预览器有效：
            -- bat / cat / git 等

            ["f3"] = "toggle-preview-wrap",
            -- 开启/关闭预览换行

            ["f4"] = "toggle-preview",
            -- 开启/关闭预览窗口

            ["shift-down"] = "preview-page-down",
            -- 预览窗口向下翻页

            ["shift-up"] = "preview-page-up",
            -- 预览窗口向上翻页

        },
    },

    actions = {

        -- fzf-lua 操作行为配置
        --
        -- 设置这里的值会覆盖默认行为
        --
        -- 如果想继承全部默认操作：
        -- actions = {
        --     files = true
        -- }
        --
        -- 然后只修改需要改变的快捷键

        files = {

            -- true,
            -- 开启后继承官方全部默认快捷键
            -- 下面设置的快捷键会覆盖默认行为


            -- 以下 action 会被这些 picker 共用：
            --
            -- files       文件搜索
            -- git_files   Git 文件搜索
            -- git_status  Git 状态文件
            -- grep        搜索结果
            -- lsp         LSP 文件定位
            -- oldfiles    最近打开文件
            -- quickfix    quickfix 列表
            -- loclist     location list
            -- tags        标签搜索
            -- btags       buffer 标签
            -- args        参数列表
            -- buffers     buffer 列表
            -- tabs        标签页
            -- lines       当前文件行
            -- blines      当前 buffer 行


            ["enter"] = FzfLua.actions.file_edit_or_qf,
            -- 回车打开文件
            --
            -- 单个选择：
            --   直接编辑文件
            --
            -- 多个选择：
            --   发送到 quickfix 列表
            --
            -- 等价于：
            -- 文件 -> :edit
            -- 多文件 -> :copen


            ["ctrl-s"] = FzfLua.actions.file_split,
            -- 使用水平分屏打开文件
            --
            -- 等价：
            -- :split 文件


            ["ctrl-v"] = FzfLua.actions.file_vsplit,
            -- 使用垂直分屏打开文件
            --
            -- 等价：
            -- :vsplit 文件


            ["ctrl-t"] = FzfLua.actions.file_tabedit,
            -- 在新 Tab 中打开文件
            --
            -- 等价：
            -- :tabedit 文件


            ["alt-q"] = FzfLua.actions.file_sel_to_qf,
            -- 将选中的文件发送到 quickfix 列表
            --
            -- 可一次选择多个文件


            ["alt-Q"] = FzfLua.actions.file_sel_to_ll,
            -- 将选中的文件发送到 location list
            --
            -- 区别：
            -- quickfix 是全局列表
            -- loclist 属于当前窗口


            ["alt-i"] = FzfLua.actions.toggle_ignore,
            -- 切换是否忽略文件
            --
            -- 例如：
            -- .gitignore 中忽略的文件
            --
            -- 开启后可以搜索隐藏/忽略文件


            ["alt-h"] = FzfLua.actions.toggle_hidden,
            -- 切换隐藏文件显示
            --
            -- 例如：
            -- .git
            -- .config
            -- .env


            ["alt-f"] = FzfLua.actions.toggle_follow,
            -- 切换是否跟随符号链接
            --
            -- true:
            --   搜索软链接目标
            --
            -- false:
            --   不进入软链接

        },

    },

    fzf_opts = {
        -- fzf 参数配置
        --
        -- 参数格式：
        -- ["参数"] = "值"
        --
        -- 例如：
        -- ["--height"] = "50%"
        --
        -- 等价于：
        -- fzf --height 50%
        --
        --
        -- 设置为：
        -- false
        -- 表示删除该参数
        --
        -- true
        -- 表示这是一个无参数值的开关
        --
        -- 如果需要传递原始参数：
        -- 请使用 fzf_args


        ["--ansi"] = true,
        -- 启用 ANSI 颜色支持
        --
        -- 允许 fzf 正确显示：
        -- 高亮颜色
        -- 图标
        -- bat 代码颜色


        ["--info"] = "inline-right",
        -- 搜索信息显示位置
        --
        -- inline-right:
        --   显示在输入框右侧
        --
        -- fzf < 0.42:
        --   使用 "inline"


        ["--height"] = "100%",
        -- fzf 高度
        --
        -- 100%:
        --   使用整个 fzf 窗口高度
        --
        -- 也可以：
        -- 50%
        -- 80%


        ["--layout"] = "reverse",
        -- 列表排列方向
        --
        -- reverse:
        --   输入框在顶部
        --   最新结果靠近输入框
        --
        -- 默认：
        --   输入框在底部


        ["--border"] = "none",
        -- fzf 内部边框样式
        --
        -- none:
        --   不显示 fzf 自己的边框
        --
        -- 因为 fzf-lua 使用 Neovim floating window
        -- 通常建议关闭


        ["--highlight-line"] = true,
        -- 高亮当前选中的整行
        --
        -- 需要：
        -- fzf >= 0.53
    },

    -- fzf 终端颜色主题配置（可选）
    --
    -- 用于设置 fzf 界面的颜色
    --
    -- 默认情况下：
    -- fzf 会使用自己的颜色方案
    --
    -- 如果希望 fzf 自动继承 Neovim 当前主题：
    --
    -- fzf_colors = true,
    --
    -- 例如：
    -- 当前使用 gruvbox / catppuccin / tokyonight
    -- fzf 会自动匹配对应颜色


    fzf_colors = {

        true,
        -- 继承 fzf 默认自动生成的颜色主题
        --
        -- 效果类似：
        -- fzf_colors = true
        --
        -- 但是允许下面自定义部分颜色
        --
        -- 未设置的颜色：
        -- 使用自动生成主题

        --------------------------------------------------
        -- fzf 普通列表文字颜色
        --------------------------------------------------

        ["fg"] = {
            "fg",
            "CursorLine"
        },
        -- 普通文本颜色
        --
        -- 从 Neovim 高亮组：
        -- CursorLine
        --
        -- 提取前景色 fg


        --------------------------------------------------
        -- fzf 背景颜色
        --------------------------------------------------

        ["bg"] = {
            "bg",
            "Normal"
        },
        -- 背景颜色
        --
        -- 使用 Normal 高亮组背景


        --------------------------------------------------
        -- 普通匹配文字颜色
        --------------------------------------------------

        ["hl"] = {
            "fg",
            "Comment"
        },
        -- 匹配字符高亮颜色
        --
        -- 使用 Comment 的前景色


        --------------------------------------------------
        -- 当前选中文件文字颜色
        --------------------------------------------------

        ["fg+"] = {
            "fg",
            "Normal",
            "underline"
        },
        -- 当前选中项文字颜色
        --
        -- 使用 Normal 前景色
        --
        -- 添加 underline 下划线效果


        --------------------------------------------------
        -- 当前选中项背景颜色
        --------------------------------------------------

        ["bg+"] = {
            "bg",
            {
                "CursorLine",
                "Normal"
            }
        },
        -- 当前选择行背景
        --
        -- 优先使用：
        -- CursorLine
        --
        -- 如果不存在：
        -- 使用 Normal


        --------------------------------------------------
        -- 当前选择项匹配文字颜色
        --------------------------------------------------

        ["hl+"] = {
            "fg",
            "Statement"
        },
        -- 当前选择项里面匹配字符颜色
        --
        -- 使用 Statement 高亮颜色


        --------------------------------------------------
        -- 信息文字颜色
        --------------------------------------------------

        ["info"] = {
            "fg",
            "PreProc"
        },
        -- 例如：
        -- 文件数量
        -- 搜索状态
        -- 行列信息


        --------------------------------------------------
        -- 输入提示符颜色
        --------------------------------------------------

        ["prompt"] = {
            "fg",
            "Conditional"
        },
        -- fzf 输入框前面的提示符颜色
        --
        -- 例如：
        -- Files❯


        --------------------------------------------------
        -- 当前选择箭头颜色
        --------------------------------------------------

        ["pointer"] = {
            "fg",
            "Exception"
        },
        -- 光标箭头：
        --
        -- > file.lua


        --------------------------------------------------
        -- 多选标记颜色
        --------------------------------------------------

        ["marker"] = {
            "fg",
            "Keyword"
        },
        -- 多选模式下：
        --
        -- ✓ file.lua


        --------------------------------------------------
        -- 加载动画颜色
        --------------------------------------------------

        ["spinner"] = {
            "fg",
            "Label"
        },
        -- 搜索等待动画颜色


        --------------------------------------------------
        -- 顶部 header 颜色
        --------------------------------------------------

        ["header"] = {
            "fg",
            "Comment"
        },
        -- 头部提示信息颜色


        --------------------------------------------------
        -- 左侧空白区域颜色
        --------------------------------------------------

        ["gutter"] = "-1",
        -- 设置 gutter 颜色
        --
        -- -1 表示透明
    },

    previewers = {

        --------------------------------------------------
        -- cat 预览器
        --------------------------------------------------

        cat = {

            cmd = "cat",
            -- 使用 cat 命令预览文件


            args = "-n",
            -- 参数：
            -- -n 显示行号

        },


        --------------------------------------------------
        -- bat 预览器（推荐）
        --------------------------------------------------

        bat = {

            cmd = "bat",
            -- 使用 bat 作为代码预览工具
            --
            -- bat 支持：
            -- 语法高亮
            -- Git 修改标记
            -- 行号


            args = "--color=always --style=numbers,changes",
            -- 参数：
            --
            -- --color=always
            -- 强制输出颜色
            --
            -- --style=numbers
            -- 显示行号
            --
            -- --style=changes
            -- 显示 Git 修改状态

        },


        --------------------------------------------------
        -- head 预览器
        --------------------------------------------------

        head = {

            cmd = "head",
            -- 使用 head 命令查看文件头部


            args = nil,
            -- 不传递额外参数

        },


        --------------------------------------------------
        -- Git Diff 预览器
        --------------------------------------------------

        git_diff = {

            -- 如果需要指定文件位置：
            --
            -- 可以使用：
            -- {file}
            --
            -- 示例：
            --
            -- cmd_modified =
            -- "git diff --color HEAD {file}"


            cmd_deleted = "git diff --color HEAD --",
            -- 已删除文件的 diff


            cmd_modified = "git diff --color HEAD",
            -- 已修改文件的 diff


            cmd_untracked = "git diff --color --no-index /dev/null",
            -- 未跟踪文件 diff


            -- 如果安装 git-delta：
            --
            -- fzf-lua 会自动检测并使用 delta
            --
            -- 如果不想使用：
            --
            -- pager=false

        },


        --------------------------------------------------
        -- man 手册预览
        --------------------------------------------------

        man = {

            cmd = "man -c %s | col -bx",
            -- Linux man 页面预览
            --
            -- -c:
            -- 使用 cat 格式输出
            --
            -- col -bx:
            -- 清理控制字符


            -- 注意：
            --
            -- 使用 man-db 时删除 -c
            --
            -- macOS:
            --
            -- man -P cat %s | col -bx

        },



        --------------------------------------------------
        -- fzf-lua 内置预览器
        --------------------------------------------------

        builtin = {


            syntax = true,
            -- 是否启用语法高亮


            syntax_limit_l = 0,
            -- 语法高亮最大行数限制
            --
            -- 0 = 不限制


            syntax_limit_b = 1024 * 1024,
            -- 语法高亮最大文件大小
            --
            -- 默认 1MB


            limit_b = 1024 * 1024 * 10,
            -- 最大预览文件大小
            --
            -- 默认 10MB
            --
            -- 0 = 不限制



            --------------------------------------------------
            -- Treesitter 预览支持
            --------------------------------------------------

            treesitter = {

                enabled = true,
                -- 开启 Treesitter 语法解析


                disabled = {},
                -- 禁用 Treesitter 的文件类型
                --
                -- 示例：
                --
                -- disabled = {
                --     "markdown"
                -- }


                context = {

                    max_lines = 1,
                    -- 显示多少行 Treesitter 上下文


                    trim_scope = "inner",
                    -- 裁剪范围
                    --
                    -- inner:
                    -- 当前作用域内部

                },

            },



            --------------------------------------------------
            -- 隐藏预览窗口行为
            --------------------------------------------------

            toggle_behavior = "default",
            -- 切换隐藏/显示预览时：
            --
            -- default:
            -- 隐藏后主窗口扩大
            --
            -- extend:
            -- 保持主窗口大小不变



            --------------------------------------------------
            -- 文件名显示处理
            --------------------------------------------------

            -- title_fnamemodify = function(s)
            --     return vim.fn.fnamemodify(s, ":t")
            -- end,
            --
            -- 默认只显示文件名最后部分



            --------------------------------------------------
            -- 图片预览扩展
            --------------------------------------------------

            extensions = {

                ["png"] = {
                    "viu",
                    "-b"
                },
                -- PNG 图片预览
                --
                -- 需要安装 viu
                --
                -- -b:
                -- block 模式输出


                ["svg"] = {
                    "chafa",
                    "{file}"
                },
                -- SVG 图片预览
                --
                -- 使用 chafa


                ["jpg"] = {
                    "ueberzug"
                },
                -- JPG 图片预览
                --
                -- 使用 ueberzug

            },


            --------------------------------------------------
            -- ueberzug 图片缩放方式
            --------------------------------------------------

            ueberzug_scaler = "cover",
            -- 图片缩放方式
            --
            -- 可选：
            --
            -- false
            -- 不缩放
            --
            -- crop
            -- 裁剪
            --
            -- distort
            -- 拉伸
            --
            -- fit_contain
            -- 完整显示
            --
            -- contain
            -- 包含
            --
            -- cover
            -- 覆盖



            --------------------------------------------------
            -- markdown 渲染
            --------------------------------------------------

            render_markdown = {

                enabled = true,
                -- 开启 markdown 渲染


                filetypes = {
                    ["markdown"] = true
                },
                -- 对 markdown 文件启用

            },



            --------------------------------------------------
            -- snacks.nvim 图片支持
            --------------------------------------------------

            snacks_image = {

                enabled = true,
                -- 启用 snacks 图片集成


                render_inline = true,
                -- 在终端内显示图片

            },

        },



        --------------------------------------------------
        -- LSP Code Action 预览
        --------------------------------------------------

        codeaction = {

            diff_opts = {
                ctxlen = 3
            },
            -- vim.diff 参数
            --
            -- ctxlen:
            -- diff 上下文显示行数

        },


        --------------------------------------------------
        -- 原生 fzf codeaction 预览
        --------------------------------------------------

        codeaction_native = {

            diff_opts = {
                ctxlen = 3
            },


            -- git-delta 自动检测
            --
            -- 可以关闭：
            --
            -- pager=false


            -- 推荐 delta 样式：
            --
            -- pager =
            -- [[
            -- delta
            -- --width=$COLUMNS
            -- --hunk-header-style="omit"
            -- --file-style="omit"
            -- ]]

        },

    },

})


local fzf = require("fzf-lua")

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = '查找文件' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = '查找字符' })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = '查找 buffers' })
vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = '查找帮助' })
vim.keymap.set('n', '<leader>fo', fzf.oldfiles, { desc = '历史文件' })
vim.keymap.set('n', '<leader>fc', fzf.colorschemes, { desc = '查找主题' })

-- 命令
vim.keymap.set("n", "<leader>f:", fzf.commands, { desc = "执行命令" })

-- Keymap
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "快捷键" })

-- Git 文件
vim.keymap.set("n", "<leader>gf", fzf.git_files, { desc = "Git文件" })

-- Git 状态
vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "Git状态" })
