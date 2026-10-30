local vim = vim

local group = vim.api.nvim_create_augroup("setupAlpha", {
	clear = true,
})

local loaded = false

vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	once = true,

	callback = function()
		-- 防止重复加载
		if loaded then
			return
		end


		-- 安装插件
		vim.pack.add({
			"https://github.com/goolord/alpha-nvim",
		})

		-- 加载 Alpha
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 自定义 ASCII Logo
		local logo = [[
██╗     ██╗   ██╗██╗███████╗
██║     ██║   ██║██║██╔════╝
██║     ██║   ██║██║███████╗
██║     ██║   ██║██║╚════██║
███████╗╚██████╔╝██║███████║
╚══════╝ ╚═════╝ ╚═╝╚══════╝
]]

		-- Dashboard 配置
		dashboard.section.header.val = vim.split(logo, "\n")

		dashboard.section.buttons.val = {
			dashboard.button("o", " 历史文件", "<cmd>lua require('fzf-lua').oldfiles()<cr>"),
			dashboard.button("f", " 查找文件", "<cmd>lua require('fzf-lua').files()<cr>"),
			dashboard.button("e", " 新建文件", "<cmd>ene <bar> startinsert <cr>"),
			dashboard.button("g", " 查找文本", "<cmd>lua require('fzf-lua').live_grep()<cr>"),
			dashboard.button("l", " 设置面板", "<cmd>e $myvimrc<cr>"),
			dashboard.button("c", " 配置文件", "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<cr>"),
			dashboard.button("q", " 退出 nvim", "<cmd>qa<cr>"),
		}

		-- 注册 Alpha 配置
		alpha.setup(dashboard.config)

		-- 手动启动 Dashboard
		alpha.start(true, dashboard.config)

		loaded = true
		-- 清理自动命令组
		vim.api.nvim_del_augroup_by_id(group)
	end,
})
