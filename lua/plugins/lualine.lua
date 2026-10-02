local group = vim.api.nvim_create_augroup("SetupLualine", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	group = group,
	-- once = true,
	callback = function()
		-- 已加载则跳过
		if package.loaded["lualine"] then
			vim.api.nvim_del_augroup_by_id(group)
			return
		end

		-- NOTE: 不区分只读文件

		---------------------------------------------------------------------
		-- 内容区:

		vim.pack.add({
			"https://github.com/nvim-lualine/lualine.nvim"
		})
		local function get_indent()
			local insert_spaces = vim.bo.expandtab
			local size = insert_spaces and vim.bo.shiftwidth or vim.bo.tabstop
			-- 󰌒 是 Nerd Font 中的缩进图标
			local icon = ">"
			return icon .. size
		end
		-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#999999" })
		-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "diagnosticsColor", { bg = "NONE", fg = "NONE" })

		-- local progress = function()
		-- 	local current_line = vim.fn.line(".")
		-- 	local total_lines = vim.fn.line("$")
		-- 	local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁", " " }
		-- 	local line_ratio = current_line / total_lines
		-- 	local index = math.ceil(line_ratio * #chars)
		-- 	return chars[index]
		-- end

		local tm = {}
		for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
			tm[mode] = {}
			for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
				tm[mode][section] = { bg = 238, fg = 250}
			end
		end

		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = tm,
				-- theme = "auto",

				component_separators = { left = '', right = '' },
				section_separators = { left = "", right = "" },

				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						'WinEnter',


						'BufEnter',
						'BufWritePost',
						'SessionLoadPost',
						'FileChangedShellPost',
						'VimResized',
						'Filetype',
						'CursorMoved',
						'CursorMovedI',
						'ModeChanged',
					},
				}
			},
			sections = {
				lualine_a = {
					-- 'mode',
				},
				lualine_b = {
					'filename',
				},
				lualine_c = {
					{
						'diagnostics',
						symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
						always_visible = false,
						color = { fg = 'green' },

						-- diagnostics_color = {
						-- 	-- Same values as the general color option can be used here.
						-- 	error = 'diagnosticsColor', -- Changes diagnostics' error color.
						-- 	warn  = 'diagnosticsColor', -- Changes diagnostics' warn color.
						-- 	info  = 'diagnosticsColor', -- Changes diagnostics' info color.
						-- 	hint  = 'diagnosticsColor', -- Changes diagnostics' hint color.
						-- },
					},
				},
				lualine_x = {
					{
						'lsp_status',
						separator = {  right = "|"}, -- 分隔符
						-- padding = 1,
						-- icon = '', -- f013
						icon = '', -- f013
						symbols = {
							-- Standard unicode symbols to cycle through for LSP progress:
							-- spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
							spinner = { '|', '/', '-', '\\', '|', '/', '-', '\\', '|', '/' },
							-- Standard unicode symbol for when LSP is done:
							done = "✓",
							-- Delimiter inserted between LSP names:
							-- separator = '|',
						},
						-- List of LSP names to ignore (e.g., `null-ls`):
						ignore_lsp = { "ba" },
						-- Display the LSP name
						show_name = true,
					},

					{
						get_indent,
						cond = function()
							return vim.bo.filetype ~= ""
						end,
						-- padding = { left = 1, right = 1 },
					},

					{
						'encoding',
						-- padding = { left = 1, right = 1 },
					},
					{
						'fileformat',
						-- padding = { left = 1, right = 1 },
						symbols = {
							unix = 'unix', -- e712
							dos = 'dos', -- e70f
							mac = 'mac', -- e711
						}
					},
					-- '%y',
					{
						"filetype",
						padding = { left = 1, right = 1 },
						icons_enabled = false,
					},

				},
				lualine_y = {
					-- progress,
					-- {
					-- 	function()
					-- 		-- 中文星期映射表
					-- 		local weekday_map = { "日", "一", "二", "三", "四", "五", "六" }

					-- 		-- 时钟 Emoji 表（0~23 点）
					-- 		local clock_emoji = {
					-- 			-- 整点（0-11）
					-- 			"🕛", "🕐", "🕑", "🕒", "🕓", "🕔",
					-- 			"🕕", "🕖", "🕗", "🕘", "🕙", "🕚",
					-- 			-- 半点（0.5-11.5）
					-- 			"🕧", "🕜", "🕝", "🕞", "🕟", "🕠",
					-- 			"🕡", "🕢", "🕣", "🕤", "🕥", "🕦"
					-- 		}

					-- 		-- 十二时辰映射表
					-- 		local shichen_map = {
					-- 			"子", "丑", "寅", "卯", "辰", "巳",
					-- 			"午", "未", "申", "酉", "戌", "亥"
					-- 		}

					-- 		local time = os.date("*t")
					-- 		local hour = time.hour

					-- 		local min = time.min

					-- 		-- 计算时辰
					-- 		local shichen_index = math.floor((hour + 1) % 24 / 2) + 1
					-- 		local shichen = shichen_map[shichen_index]

					-- 		-- 判断整点 or 半点
					-- 		local is_half = min >= 30 and 1 or 0
					-- 		-- 计算 emoji 索引：0点开始，整点在前（0~11），半点加上12
					-- 		local emoji_index = ((hour % 12) + (is_half * 12)) + 1
					-- 		local emoji = clock_emoji[emoji_index]

					-- 		return string.format(
					-- 		-- "%d/%d %s%s时 周%s",
					-- 			"%d/%d %s周%s",
					-- 			-- time.year,
					-- 			time.month,
					-- 			time.day,
					-- 			-- time.hour,
					-- 			-- time.min,
					-- 			emoji,
					-- 			-- shichen,
					-- 			weekday_map[time.wday]
					-- 		)
					-- 	end,
					-- 	-- padding = { left = 1, right = 1 },
					-- 	-- separator = { left = ">" , right = "<"}, -- 分隔符
					-- 	-- color = {
					-- 	-- 	bg = "#fe595d",
					-- 	-- 	fg = "#111111",
					-- 	-- 	gui = "bold",
					-- 	-- 	-- gui = "bold,underline,italic",
					-- 	-- }

					-- },
				},
				lualine_z = {
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
		})

		vim.api.nvim_del_augroup_by_id(group)
	end,
})
