local group = vim.api.nvim_create_augroup("setupFlash", {
	clear = true -- 创建时清除该组中之前存在的自动命令
})
local loaded = false
vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	-- once = true,
	callback = function()

		if loaded or package.loaded["flash"] then
			loaded = true
			vim.api.nvim_del_augroup_by_id(group)
			return
		end

		vim.pack.add({
			"https://github.com/folke/flash.nvim",
		})

		require("flash").setup({
			modes = {
				char = {
					jump_labels = false
				}
			}
		})

		vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)
		vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end)
		vim.keymap.set("o", "r", function() require("flash").remote() end)
		vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
		vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end)

		loaded = true
		vim.api.nvim_del_augroup_by_id(group)
	end,
})
