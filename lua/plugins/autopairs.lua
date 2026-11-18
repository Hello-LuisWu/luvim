-- NOTE: p: 成对符号补齐
local loaded = false
local group = vim.api.nvim_create_augroup("setupAutopairs", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = group,
	callback = function()

		-- 防止重复加载
		if loaded or package.loaded["nvim-autopairs"] then
			loaded = true
			vim.api.nvim_del_augroup_by_id(group)
			return
		end

		-- 加载插件
		vim.pack.add({
			"https://github.com/windwp/nvim-autopairs",
		})

		-- 配置插件
		require("nvim-autopairs").setup({
			check_ts = true,
		})
		loaded = true
		vim.api.nvim_del_augroup_by_id(group)
	end,
})
