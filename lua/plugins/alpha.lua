-- NOTE: p: 首页

vim.pack.add({
    gh("goolord/alpha-nvim"),
})

-- 获取 Lazy.nvim 启动时间
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
alpha.setup(require 'alpha.themes.dashboard'.config)

-- 自定义 ASCII 艺术 Logo
local logo = [[
██╗     ██╗   ██╗██╗███████╗    ███████╗██████╗ ██╗████████╗ ██████╗ ██████╗
██║     ██║   ██║██║██╔════╝    ██╔════╝██╔══██╗██║╚══██╔══╝██╔═══██╗██╔══██╗
██║     ██║   ██║██║███████╗    █████╗  ██║  ██║██║   ██║   ██║   ██║██████╔╝
██║     ██║   ██║██║╚════██║    ██╔══╝  ██║  ██║██║   ██║   ██║   ██║██╔══██╗
███████╗╚██████╔╝██║███████║    ███████╗██████╔╝██║   ██║   ╚██████╔╝██║  ██║
╚══════╝ ╚═════╝ ╚═╝╚══════╝    ╚══════╝╚═════╝ ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
]]

-- Dashboard 配置
dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
    dashboard.button("o", "  历史文件", ":lua require('fzf-lua').oldfiles()<CR>"),
    dashboard.button("f", "󰈞  查找文件", ":lua require('fzf-lua').files()<CR>"),
    dashboard.button("e", "  新建文件", ":ene <BAR> startinsert <CR>"),
    dashboard.button("g", "  查找文本", ":lua require('fzf-lua').live_grep()<CR>"),
    dashboard.button("l", "  设置面板", ":e $MYVIMRC<CR>"),
    dashboard.button("c", "  配置文件", ":lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<CR>"),
    dashboard.button("q", "󰅚  退出 NVIM", ":qa<CR>"),

    -- dashboard.button("o", "  历史文件", ":lua require('telescope.builtin').oldfiles() <CR>"),
    -- dashboard.button("f", "󰈞  查找文件", ":lua require('telescope.builtin').find_files() <CR>"),
    -- dashboard.button("e", "  新建文件", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("g", "  查找文本", ":lua require('telescope.builtin').live_grep() <CR>"),
    -- dashboard.button('l', '  设置面板', ':e $MYVIMRC<CR>'),
    -- dashboard.button('c', '  配置文件', ':Telescope find_files cwd=' .. vim.fn.stdpath('config') .. '<CR>'), -- 新增
    -- dashboard.button("q", "󰅚  推出 NVIM", ":qa<CR>"),

}
