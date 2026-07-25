vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua"
})

local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        fullscreen = true,
        treesitter = {
            enabled = true,     -- 启用 Treesitter 语法高亮

            fzf_colors = {
                ["hl"] = "-1:reverse",     -- 普通匹配结果高亮颜色
                ["hl+"] = "-1:reverse"     -- 当前选中结果高亮颜色
            },
        },
        preview = {

            border = "rounded",     -- 预览窗口边框样式
            -- 支持 nvim_open_win 的边框样式
            -- 也支持 fzf 原生边框，例如：
            -- "border-top"
            -- "none"

            -- 原生预览器（bat/cat/git 等）
            -- 也可以通过函数动态设置：
            -- border = function(winopts, metadata)

            wrap = false,     -- 是否开启预览内容自动换行
            -- true  = 自动换行
            -- false = 不换行

            hidden = false,     -- 是否默认隐藏预览窗口
            -- true  = 隐藏
            -- false = 显示

            vertical = "down:45%",     -- 垂直布局时：
            -- 预览窗口显示在下面
            -- 占整个窗口高度 45%

            horizontal = "right:70%",     -- 水平布局时：
            -- 预览窗口显示在右侧
            -- 占整个窗口宽度 10%

            layout = "flex",     -- 预览布局方式
            -- horizontal = 始终左右布局
            -- vertical   = 始终上下布局
            -- flex       = 自动根据窗口宽度切换

            flip_columns = 100,     -- flex 模式切换阈值
            -- 当窗口宽度小于 100 列：
            -- 使用上下布局
            --
            -- 当窗口宽度大于 100 列：
            -- 使用左右布局

            title = true,     -- 是否显示预览窗口标题
            -- 标题显示当前文件名

            title_pos = "center",     -- 标题位置
            -- left    = 左
            -- center  = 中
            -- right   = 右

            scrollbar = "float",     -- 预览窗口滚动条样式
            -- false   = 不显示
            -- float   = 浮动滚动条
            -- border  = 使用边框滚动条

            scrolloff = -1,     -- 滚动条距离右侧边缘的位置
            -- 只对 scrollbar="float" 有效

            delay = 20,     -- 预览延迟时间（毫秒）
            -- 防止快速移动选择时频繁刷新导致卡顿

            winopts = {                     -- 内置预览器窗口配置
                number = true,              -- 显示行号
                relativenumber = false,     -- 是否显示相对行号
                cursorline = true,          -- 高亮当前光标所在行
                cursorlineopt = "both",     -- 光标行高亮范围
                -- both = 行和列

                cursorcolumn = false,     -- 是否高亮当前光标所在列

                signcolumn = "no",        -- 是否显示符号列
                -- no = 不显示（关闭 git/lsp 标记）

                list = false,     -- 是否显示不可见字符
                -- false = 不显示

                foldenable = false,        -- 禁用代码折叠

                foldmethod = "manual",     -- 折叠方式
                -- manual = 手动折叠
            },
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
vim.keymap.set("n", "<leader>fd", fzf.commands, { desc = "执行命令" }) -- 命令
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "快捷键" }) -- Keymap
vim.keymap.set("n", "<leader>fe", fzf.git_files, { desc = "Git文件" }) -- Git 文件
vim.keymap.set("n", "<leader>fs", fzf.git_status, { desc = "Git状态" }) -- Git 状态
