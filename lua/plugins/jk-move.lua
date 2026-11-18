local group = vim.api.nvim_create_augroup("setupJkmove", {
	clear = true -- 创建时清除该组中之前存在的自动命令
})
local loaded = false
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = group,
	-- once = true,
	callback = function()

		if loaded then
			return
		end

		vim.pack.add({
			"https://github.com/xiyaowong/accelerated-jk.nvim"
		})

		require('accelerated-jk').setup({
			-- equal to
			-- nmap <silent> j <cmd>lua require'accelerated-jk'.command('gj')<cr>
			-- nmap <silent> k <cmd>lua require'accelerated-jk'.command('gk')<cr>
			mappings = { j = 'gj', k = 'gk' },
			-- If the interval of key-repeat takes more than `acceleration_limit` ms, the step is reset
			acceleration_limit = 150,
			-- acceleration steps
			acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
			-- If you want to decelerate a cursor moving by time instead of reset. set it
			-- exampe:
			-- {
			--   { 200, 3 },
			--   { 300, 7 },
			--   { 450, 11 },
			--   { 600, 15 },
			--   { 750, 21 },
			--   { 900, 9999 },
			-- }
			deceleration_table = { { 150, 9999 } },
		})



		loaded = true

		-- 优化点 3：加载成功后立即清除当前自动命令组
		-- 确保整个插件生命周期内，这段逻辑只运行一次成功加载过程
		vim.api.nvim_del_augroup_by_id(group)
	end,
})
