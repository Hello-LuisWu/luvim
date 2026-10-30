-- 创建一个自动命令组
-- 使用固定名称可以避免重复创建自动命令时产生多个相同配置
local group = vim.api.nvim_create_augroup("setupAlign", { clear = true })

local loaded = false

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = group,
	-- once = true,
	callback = function(args)
		local buf = args.buf

		-- 1. 防止重复加载
		if loaded or package.loaded["mini.align"] then
			loaded = true
			vim.api.nvim_del_augroup_by_id(group)
			return
		end

		-- 防止重复加载
		-- if loaded then
		-- 	return
		-- end

		-- 如果模块已经加载，则清理自动命令组
		-- if package.loaded["mini.align"] then
		-- 	vim.api.nvim_del_augroup_by_id(group)
		-- 	return
		-- end


		-- 只处理普通、可写文件 (可选)
		if vim.bo[buf].buftype ~= ""
			or not vim.bo[buf].modifiable
			or vim.bo[buf].readonly
		then
			return
		end

		------------------------- start





		------------------------- end
		-- 标记加载完成
		loaded = true

		-- 优化点 3：加载成功后立即清除当前自动命令组
		-- 确保整个插件生命周期内，这段逻辑只运行一次成功加载过程
		vim.api.nvim_del_augroup_by_id(group)
	end,
})
