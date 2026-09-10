-- ------------------------------------------------------------------------------
-- Author   : Luis Wu
-- Editor   : Neovim
-- Date     : 2026-07-29 23:51
-- Position : /Users/luis/.config/nvim/lua/config/keymap.lua
-- System   : Darwin 25.2.0
-- ------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set
local ns = { noremap = true, silent = true }
local nsf = { noremap = true, silent = false }

map("i", "<c-enter>", "<C-[>o")
map("i", "<S-enter>", "<C-[>o")

-- 基础键位
map("i", "jj", "<C-[>", ns)
map("i", "<C-k>", "<C-[>O", ns)
map("i", "<C-j>", "<C-[>o", ns)
map("n", "<Tab>", ":", nsf)
map("v", "p", "P", nsf)
map("n", "-", "<C-x>", nsf)
map("n", "+", "<C-a>", nsf)
map("n", "<BS>", ":set hlsearch!<CR>", ns)
map("n", "<leader><CR>", ":set wrap!<CR>", { desc = "换行按钮", noremap = true, silent = true })
map({ "n", "x" }, "<leader>j", "J", { desc = "向下融合", noremap = true, silent = true })

map("n", "<C-t>", function()
    vim.cmd("botright split | terminal")
    vim.cmd("resize 10")
    vim.cmd("startinsert")
end, {
    desc = "Open terminal",
})

map({ "n", "v" }, "gF", "gg=G", { desc = "自动缩进", noremap = true, silent = true })

map({ "n", "v" }, "<leader>ss", "<cmd>set spell!<CR>", { desc = "开启/关闭拼写", noremap = true, silent = true })
map({ "n", "v" }, "<leader>s]", "]s", { desc = "下一个拼写错误", noremap = true, silent = true })
map({ "n", "v" }, "<leader>s[", "[s", { desc = "上一个拼写错误", noremap = true, silent = true })
map({ "n", "v" }, "<leader>sa", "zg", { desc = "将单词添加到词典", noremap = true, silent = true })
map({ "n", "v" }, "<leader>sd", "zw", { desc = "将单词移出词典", noremap = true, silent = true })
map({ "n", "v" }, "<leader>su", "zu", { desc = "撤销 zg/zw", noremap = true, silent = true })

map("n", "W", "5w", ns)
map("n", "B", "5b", ns)

-- 普通模式,可视模式和等待操作模式下,行的首尾 & 页面的首尾跳转
map({ "n", "o", "v" }, "L", "$", ns)
map({ "n", "o", "v" }, "H", "0", ns)
map({ "n", "o", "v" }, "J", "G", ns)
map({ "n", "o", "v" }, "K", "gg", ns)

-- tab 管理
map("n", "tn", "<Cmd>tabnew<CR>", { noremap = true, desc = "新建标签页" })
map("n", "tc", "<Cmd>tabclose<CR>", { noremap = true, desc = "关闭标签页" })
map("n", "to", "<Cmd>tabonly<CR>", { noremap = true, desc = "关闭其他标签页" })
map("n", "tt", "<Cmd>tabnext<CR>", { noremap = true, desc = "下一个标签页" })
map("n", "TT", "<Cmd>tabprevious<CR>", { noremap = true, desc = "上一个标签页" })

-- Buffer 管理
map("n", "<leader>bn", ":bnext<CR>", { noremap = true, desc = "切换到下一个 Buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { noremap = true, desc = "切换到上一个 Buffer" })
map("n", "<leader>bf", ":bfirst<CR>", { noremap = true, desc = "切换到第一个 Buffer" })
map("n", "<leader>bl", ":blast<CR>", { noremap = true, desc = "切换到最后一个 Buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { noremap = true, desc = "删除当前 Buffer" })
map("n", "<leader>bw", ":bwipeout<CR>", { noremap = true, desc = "完全删除当前 Buffer" })
map("n", "<leader>bD", ":bdelete!<CR>", { noremap = true, desc = "强制删除当前 Buffer" })
map("n", "<leader>bW", ":bwipeout!<CR>", { noremap = true, desc = "强制完全删除当前 Buffer" })

-- 5. 快速跳转
map("n", "<C-f>", "<C-f>zz", ns) -- 向下翻页并居中
map("n", "<C-b>", "<C-b>zz", ns) -- 向上翻页并居中
map("n", "n", "nzzzv", ns)       -- 搜索结果时光标居中
map("n", "N", "Nzzzv", ns)
map("n", "g,", "g,zz", { desc = "跳转变更位置并居中" })

map({ "v", "x" }, "<C-j>", ":m '>+1<CR>gv=gv", ns)
map({ "v", "x" }, "<C-k>", ":m '<-2<CR>gv=gv", ns)
-- 解决 cmdheight = 0, Visual 模式下 C-h/j/k/l 移动 3 行以上代码失败的问题
require("vim._core.ui2").enable({
    enable = true,
    msg = { -- 与消息模块（message module）相关的配置选项。

        ---@type 'cmd'|'msg'
        ---默认消息显示目标：
        ---'cmd' 表示显示在命令行区域；
        ---'msg' 表示显示在独立的临时消息窗口中。
        targets = 'cmd', -- 默认消息显示位置，当前设置为命令行区域。

        ---@type string|table<string, 'cmd'|'msg'|'pager'>
        ---默认消息目标，或者通过 table 根据消息类型和触发条件映射不同显示目标。
        ---例如：
        -- {
        --   search_count = 'msg',
        --   aconfirm = 'msg',
        -- },
        ---可以让不同类型消息显示在不同位置。

        cmd = {          -- 与命令行窗口（cmdline window）中的消息相关的配置。

            height = 0.5 -- 命令行区域展开显示消息时的最大高度，占编辑器高度的 50%。
        },

        dialog = {        -- 与对话框窗口（dialog window）相关的配置。

            height = 0.5, -- 对话框窗口的最大高度，占编辑器高度的 50%。
        },

        msg = {             -- 与消息窗口（message window）相关的配置。

            height = 0.5,   -- 消息窗口最大高度，占编辑器高度的 50%。

            timeout = 4000, -- 消息显示时间，单位为毫秒（4000ms = 4秒）。
        },

        pager = {       -- 与分页消息窗口（pager window）相关的配置。

            height = 1, -- 分页窗口最大高度，占编辑器高度的 100%。
        },
    },
})

map("v", "<", "<gv", ns)
map("v", ">", ">gv", ns)
map("v", "<S-tab>", "<gv", ns)
map("v", "<tab>", ">gv", ns)
map("v", "<C-h>", "<gv", ns)
map("v", "<C-l>", ">gv", ns)

-- map({ "i", "n", "v" }, "<Left>", "<Nop>", ns)
-- map({ "i", "n", "v" }, "<Right>", "<Nop>", ns)
map({ "i", "n", "v" }, "<Up>", "<Nop>", ns)
map({ "i", "n", "v" }, "<Down>", "<Nop>", ns)
map("i", "<Esc>", "<Nop>", ns)
map({ "n", "v" }, "q:", "<Nop>", { desc = "Disable command-line window", noremap = true })
map({ "n", "v" }, "q", "<Nop>", { desc = "Disable command-line window", noremap = true })
map({ "n", "v" }, "Q", "q", { noremap = true })

map("n", "j", "gj", ns)
map("n", "k", "gk", ns)

map("i", "HH", "<C-[>I", ns)
map("i", "LL", "<C-[>A", ns)
map({ "i" }, "<C-d>", "<C-[>yypA", ns)
map({ "n" }, "<C-d>", "<C-[>yyp", { desc = "再制", noremap = true, silent = true })

map("n", "<leader>dh", function()
    local path = vim.fn.expand("%:p")
    local home = vim.fn.expand("~")
    path = path:gsub("^" .. home, "~")
    vim.fn.setreg("+", path)
end, { desc = "复制家目录相对路径" })

-- 复制当前文件相对路径
map("n", "<leader>dP", function()
    vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "复制文件相对路径" })

map("n", "<leader>dp", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "复制文件路径" })

map("n", "<leader>dw", function()
    vim.cmd("pwd")
end, { desc = "打印当前工作目录" })

map("n", "<leader>dW", function()
    local cwd = vim.fn.getcwd()
    local home = vim.fn.expand("~")
    if cwd:sub(1, #home) == home then
        cwd = "~" .. cwd:sub(#home + 1)
    end
    print(cwd)
end, { desc = "打印当前工作目录" })

map("n", "<leader>dn", function()
    vim.fn.setreg("+", vim.fn.expand("%:t"))
end, { desc = "复制文件名" })

map("n", "<leader>dd", function()
    vim.cmd("cd " .. vim.fn.expand("%:p:h"))
    vim.cmd("pwd")
end, { desc = "切换文件目录为工作目录" })

-- 在 normal 模式配置快捷键

map('n', '<Leader>hA', ":%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>", { desc = "全部替换当前单词（带确认）", noremap = true }) -- \%V 用于匹配可视选区
map('n', '<Leader>ha', ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { desc = "全部替换当前单词", noremap = true }) -- \%V 用于匹配可视选区
map('n', '<Leader>hH', ':s/\\<<C-r><C-w>\\>//<left>', { desc = "替换当前单词", noremap = true }) --
map('n', '<Leader>hh', ':s/', { desc = "全局替换当前单词（所有行）", noremap = true })
-- map('n', '<Leader>hJ', ':%s//gc<left><left><left>', { desc = "手输全局替换（带确认）", noremap = true }) --

-- 在 visual 模式配置快捷键
map('v', '\\\\', '"hy:s/<C-r>h//<left>', { desc = "全局替换全部选中文本", noremap = true }) --
map('v', '<Leader>hH', '"hy:%s/<C-r>h//gc<left><left><left>', { desc = "全局替换全部选中文本（带确认）", noremap = true })

map('n', '<Leader>hw', [[:let @/ = '\<'.expand('<cword>').'\>'<bar>set hlsearch<CR>]],
    { desc = "查找高亮当前单词", noremap = true })

-- 13. 透明背景切换（适配你的高亮配置）
-- map("n", "\\", ":lua ToggleTransparency()<CR>", ns)
-- function ToggleTransparency()
--     local hl = vim.api.nvim_set_hl
--     hl(0, "Normal", { fg = "#aaffbb", bg = "NONE" })
--     hl(0, "NormalNC", { bg = "NONE" })
-- end

local function show_date()
    -- 中文星期映射表
    local weekday_map = { "日", "一", "二", "三", "四", "五", "六" }

    -- 时钟 Emoji 表（0~23 点）
    local clock_emoji = {
        -- 整点（0-11）
        "🕛", "🕐", "🕑", "🕒", "🕓", "🕔",
        "🕕", "🕖", "🕗", "🕘", "🕙", "🕚",
        -- 半点（0.5-11.5）
        "🕧", "🕜", "🕝", "🕞", "🕟", "🕠",
        "🕡", "🕢", "🕣", "🕤", "🕥", "🕦"
    }

    -- 十二时辰映射表
    local shichen_map = {
        "子", "丑", "寅", "卯", "辰", "巳",
        "午", "未", "申", "酉", "戌", "亥"
    }

    local time = os.date("*t")
    local hour = time.hour

    local min = time.min

    -- 计算时辰
    local shichen_index = math.floor((hour + 1) % 24 / 2) + 1
    local shichen = shichen_map[shichen_index]

    -- 判断整点 or 半点
    local is_half = min >= 30 and 1 or 0
    -- 计算 emoji 索引：0点开始，整点在前（0~11），半点加上12
    local emoji_index = ((hour % 12) + (is_half * 12)) + 1
    local emoji = clock_emoji[emoji_index]

    return string.format(
    -- "%d/%d %s%s时 周%s",
        "%d/%d %s:%s 周%s",
        -- time.year,
        time.month,
        time.day,
        time.hour,
        time.min,
        -- emoji,
        -- shichen,
        weekday_map[time.wday]
    )
end


-- map("n", "\\", function()
--         print(" " .. show_date())
--     end,
--     { desc = "显示日期", noremap = true }
-- )


map({ "n", "v", "x" }, "<leader>uu", "gu", { desc = "转换小写", noremap = true, silent = true })
map({ "n", "v", "x" }, "<leader>uU", "gU", { desc = "转换大写", noremap = true, silent = true })
map({ "n", "v", "x" }, "<leader>ut", "~", { desc = "大小写转换", noremap = true, silent = true })

map({ "n", "v", "x" }, "gu", "<Nop>", { desc = "no", noremap = true, silent = true })
map({ "n", "v", "x" }, "gU", "<Nop>", { desc = "no", noremap = true, silent = true })
map({ "n", "v", "x" }, "~", "<Nop>", { desc = "no", noremap = true, silent = true })

-- 窗口间的跳转
map("n", "<C-h>", "<C-w>h", ns)
map("n", "<C-j>", "<C-w>j", ns)
map("n", "<C-k>", "<C-w>k", ns)
map("n", "<C-l>", "<C-w>l", ns)

-- 窗口移动
map("n", "<leader>wh", "<C-w>H", { desc = "将窗口移到最左边", noremap = true, silent = true })
map("n", "<leader>wl", "<C-w>L", { desc = "将窗口移到最右边", noremap = true, silent = true })
map("n", "<leader>wk", "<C-w>K", { desc = "将窗口移到最上边", noremap = true, silent = true })
map("n", "<leader>wj", "<C-w>J", { desc = "将窗口移到最下边", noremap = true, silent = true })

map("n", "<leader>ue", ":set fileencoding=UTF-8<CR>", { desc = "编码转为 UTF-8", noremap = true, silent = true })
map('n', '<leader>uE', function()
    local encode = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
    print("文件编码: " .. encode)
end, { desc = "显示文件编码" })

vim.keymap.set('n', '<leader>uI', function()
    -- 获取缩进宽度
    local sw = vim.bo.shiftwidth
    if sw == 0 then sw = vim.bo.tabstop end
    -- 判断是空格还是 Tab
    local method = vim.bo.expandtab and "Spaces" or "Tabs"
    print(string.format("缩进宽度: %d (%s)", sw, method))
end, { desc = "显示缩进宽度" })
vim.keymap.set("n", "<leader>ui", function()
    local size = vim.bo.shiftwidth == 2 and 4 or 2
    vim.bo.shiftwidth = size
    vim.bo.tabstop = size
    vim.bo.softtabstop = size
    print(">" .. size)
end, {
    desc = "临时切换缩进 2/4"
})

map("n", "<leader>um", ":set fileformat=unix<CR>", { desc = "格式转为 unix", noremap = true, silent = true })
map('n', '<Leader>uM', function()
    print("文件格式: " .. vim.bo.fileformat) -- vim.bo 表示当前缓冲区的选项
end, { desc = '显示文件格式' })

-- 合并显示文件信息：格式 + 缩进 + 编码
vim.keymap.set('n', '\\', function()
    -- 1. 文件格式
    local fileformat = vim.bo.fileformat -- "unix", "dos", "mac"

    -- 2. 缩进宽度
    local sw = vim.bo.shiftwidth
    if sw == 0 then sw = vim.bo.tabstop end
    -- local method = vim.bo.expandtab and "Spaces" or "Tabs"

    -- 3. 文件编码
    local encode = vim.bo.fileencoding
    if encode == "" then encode = vim.o.encoding end

    local ft = vim.bo.filetype

    -- 拼接信息并打印
    local info = string.format(
        " %s >%d %s %s",
        fileformat, sw, encode, ft
    )
    print(info)
end, { desc = "显示文件格式、缩进、编码" })

map("n", "<leader>wc", "<cmd>close<CR>", { desc = "关闭窗口", noremap = true, silent = true })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "关闭其他窗口", noremap = true, silent = true })
map("n", "<leader>ws", "<cmd>vsplit<CR>", { desc = "垂直分屏", noremap = true, silent = true })
map("n", "<leader>wS", "<cmd>split<CR>", { desc = "水平分屏", noremap = true, silent = true })
map("n", "<leader>wd", "<C-w>=", { desc = "窗口等宽高", noremap = true, silent = true })
map("n", "<leader>wn", "<C-w>n", { desc = "新建空白窗口", noremap = true, silent = true })
-- map("n", "<leader>wc", "<cmd>cd %:p:h<CR><cmd>echo getcwd()<CR>", { desc = "进入当前文件所在目录", noremap = true, silent = true })

-- 调整窗口大小（Shift + 方向键）
map("n", "<S-left>", ":vertical resize -5<CR>", { desc = "向左调整窗口宽度", noremap = true, silent = true })
map("n", "<S-right>", ":vertical resize +5<CR>", { desc = "向右调整窗口宽度", noremap = true, silent = true })
map("n", "<S-up>", ":resize -5<CR>", { desc = "向上调整窗口高度", noremap = true, silent = true })
map("n", "<S-down>", ":resize +5<CR>", { desc = "向下调整窗口高度", noremap = true, silent = true })

-- 复制粘贴
-- map({ "n", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "保存", noremap = true, silent = true })
-- map({ "v" }, "<C-c>", '"+y', { desc = "复制", noremap = true, silent = true })
-- map({ "v", "n" }, "<C-v>", '"+p', { desc = "粘贴", noremap = true, silent = true })
map("i", "<C-v>", '<Esc>"+pa', { desc = "粘贴", noremap = true, silent = true })

map("n", "U", "<C-r>", ns)

-- markdown 相关映射
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        local map = vim.keymap.set
        local opt = { noremap = true }
        map("i", "\\\\", "<ESC>/<++><CR>:nohls<CR>c4l", { desc = '清除标记', noremap = true, silent = true }) -- jkej
        -- map("i", "---", "<Enter>---<Enter><br/><Enter><Enter>", opt) -- 分割线
        map("i", "BB", "**** <++><Esc>6hi", opt) -- 加粗
        map("i", "DD", "****** <++><Esc>7hi", opt) -- 加粗并斜体
        map("i", "II", "** <++><Esc>F*i", opt) -- 斜体
        map("i", "SS", "~~~~ <++><esc>6hi", opt) -- 删除线
        map("i", "UU", "<u></u> <++><Esc>2F<i", opt) -- 下划线
        map( -- 展开列表
        -- ******
            "i",
            "LS",
            "<details><Enter><summary></summary><Enter><++><Enter></details><Enter><Enter><++><Esc>4k$F<i",
            opt
        )
        -- 格式块
        map(
            "i",
            "~~",
            "~~~<Enter><Enter>~~~<Enter><++><Esc>2kA",
            opt
        )
        -- 添加图片
        map("i", "PP", "![](<++>) <++><Esc>F[a", opt)
        -- 添加链接
        map("i", "AA", "[](<++>) <++><Esc>F[a", opt)

        -- 2-4级标题
        map("i", "@@", "##<Space>", opt)
        map("i", "##", "###<Space>", opt)
        map("i", "$$", "####<Space>", opt)
    end,
})
