local wk = require("which-key")

wk.setup({
    -- 布局预设："classic"经典/"modern"现代/"helix"螺旋
    preset = "helix",
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        ellipsis = "…",
        -- set to false to disable all mapping icons,
        -- both those explicitly added in a mapping
        -- and those from rules
        mappings = true,
        --- See `lua/which-key/icons.lua` for more details
        --- Set to `false` to disable keymap icons from rules
        ---@type wk.IconRule[]|false
        rules = {},
        -- use the highlights from mini.icons
        -- When `false`, it will use `WhichKeyIcon` instead
        colors = true,
        -- used by key format
        keys = {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = "󰘴 ",
            M = "󰘵 ",
            D = "󰘳 ",
            S = "󰘶 ",
            CR = "󰌑 ",
            Esc = "󱊷 ",
            ScrollWheelDown = "󱕐 ",
            ScrollWheelUp = "󱕑 ",
            NL = "󰌑 ",
            BS = "󰁮",
            Space = "󱁐 ",
            Tab = "󰌒 ",
            F1 = "󱊫",
            F2 = "󱊬",
            F3 = "󱊭",
            F4 = "󱊮",
            F5 = "󱊯",
            F6 = "󱊰",
            F7 = "󱊱",
            F8 = "󱊲",
            F9 = "󱊳",
            F10 = "󱊴",
            F11 = "󱊵",
            F12 = "󱊶",
        },
    },
    win = {
        no_overlap = false,         -- 禁止弹出窗口与光标重叠 width = 80,
        width = 80,
        height = { min = 4, max = 25 },
        padding = { 1, 1 }, -- 设置弹出窗口的内边距（上/下，左/右）
        title = " 快捷键列表 ", -- 显示窗口标题
        title_pos = "center", -- 标题位置
        zindex = 1000, -- 设置窗口的 z-index

        bo = {
        },
        wo = {
            winblend = 0,         -- 弹窗背景0-100的不透明度，
        },
    },
})

wk.add({
    {
        mode = { "n", "v" },
        { "<leader>f", group = "查找", icon = "󰮗 " }, -- group
        { "<leader>w", group = "窗口", icon = " " },
        { "<leader><tab>", group = "tab", icon = " " },
        { "<leader>g", group = "git", icon = " " },
        { "<leader>b", group = "buffer", icon = " " },
        { "<leader>\\", desc = "块注释", icon = "󰆈" },
        -- { "<leader>-", desc = "yazi 文件浏览器", icon = "󰇥" },
        { "<leader>e", icon = " ", name = "文件浏览器" },
        { "<leader><CR>", icon = "󰖶 ", name = "换行开关" },
        { "<leader>a", icon = "󰚡 ", desc= "文本对齐" },
        { "<leader>o", group = "杂项", icon = " " },
        { "<leader>m", group = "Markdown", icon = " " },
        { "<leader>t", group = "终端", icon = " " },
        { "<leader>h", group = "搜索与替换", icon = " " },
        { "<leader>x", group = "Trouble", icon = " " },
        { "<leader>u", group = "文件设置", icon = " " },
        --
    },
    {
        mode = "n",
        { "<leader>s", group = "拼写", icon = "", },
        --   kkjfzjkj tjdjnhkfkj jkdfgjk jrgzdjf
        -- kjdjrkt jzksrfgj jko;orsfgjk rzjkgj jiserbgjfj EAUIFDesa zrsfhxiop
    },
    {
        mode = "v",
        { "<leader>\\", desc = "符号对其" }
    }
})
