vim.pack.add({
	"https://github.com/willothy/nvim-cokeline"
})

local get_hex = require('cokeline.hlgroups').get_hl_attr
local vim = vim

local function get_gui_color(group, attribute)
	local hl = get_hl(0, { name = group, link = false, })
	return hl[attribute]
end

-- ------------------------------------------------------------
-- 2. 加载插件
-- ------------------------------------------------------------
require("cokeline").setup({
	buffers = {
		focus_on_delete = "prev", -- 删除 Buffer 切换到左边 Buffer. "prev": 前一个, next: 后一个
		new_buffers_position = "last", -- 新 Buffer 放最后; last: 最后, next: 当前 Buffer 后面, directory: 按路径排序, number: 按 bufnr 排序
		delete_on_right_click = true, -- 右键点击 Buffer 时关闭

	},
	mappings = {
		-- 到达第一个 / 最后一个 Buffer 后继续切换时循环
		cycle_prev_next = true,

		-- 是否禁用鼠标操作
		disable_mouse = false,
	},
	history = { -- 记录最近访问过的 Buffer。
		---@type boolean
		enabled = true,
		-- 保存最近 5 个 Buffer
		size = 5
	},
	rendering = {
		max_buffer_width = 24, -- 最大显示24个字符宽度
	},
	pick = {
		use_filename = true,                                        -- 优先使用文件名首字母
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP", -- 可使用的选择字符
	},
	sidebar = {                                                     -- 使用 nvim-tree / neo-tree 可以在这里配置左侧区域。
		filetype = { "NvimTree", "neo-tree" },
		components = {
			{
				text = function(buf)
					return buf.filetype
				end,
				-- fg = yellow,
				-- bg = function() return get_hex('NvimTreeNormal', 'bg') end,
				-- bold = true,
			},
		},
	},

	default_hl = {
		-- text="j",
		-- fg = function(buffer)
		--     return
		--         buffer.is_focused
		--         and get_hex('Normal', 'fg')
		--         or get_hex('Comment', 'fg')
		-- end,
		-- bg = get_hex('Normal', 'bg'),


		-- default: `ColorColumn`'s background color for focused buffers,
		-- `Normal`'s foreground color for unfocused ones.
		---@type nil | string | fun(buffer: Buffer): string
		-- fg = nil,
		fg = function(buffer) -- 当前 Buffer
			if buffer.is_focused then
				return cls_cterm.white
			end
			-- 非当前 Buffer
			return cls_cterm.gray_light
		end,
		---@type nil | string | function(buffer: Buffer): string,
		bg = nil,
		-- default: unset.
		---@type nil | string | function(buffer): string,
		sp = nil,

		---@type nil | boolean | fun(buf: Buffer):boolean
		bold = function(buffer)
			return buffer.is_focused
		end,
		---@type nil | boolean | fun(buf: Buffer):boolean
		italic = nil,
		---@type nil | boolean | fun(buf: Buffer):boolean
		underline = nil,
		---@type nil | boolean | fun(buf: Buffer):boolean
		undercurl = nil,
		---@type nil | boolean | fun(buf: Buffer):boolean
		strikethrough = nil,

	},

	components = {

		-- ① 左侧分隔符
		{
			text = function(buffer)
				-- 第一个 buffer 不显示分隔符
				if buffer.index == 1 then
					return " "
				end

				return "|"
			end,

			-- 使用 Normal 的前景色
			fg = function()
				return vim.api.nvim_get_hl(0, {
					name = "Comment",
					link = false,
				}).fg
			end,
		},


		-- ② 文件图标
		{
			text = "",

			-- 图标颜色使用 nvim-web-devicons 提供的颜色
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},

		-- Buffer 编号
		{
			text = function(buffer)
				return " " .. buffer.index .. " "
			end,

			-- 当前 Buffer 的编号加粗
			bold = function(buffer)
				return buffer.is_focused
			end,
		},

		{
			text = function(buffer) return buffer.unique_prefix end,
			fg = get_hex('Comment', 'fg'),
			italic = true,
		},


		-- ③ 文件名
		{
			text = function(buffer)
				return buffer.filename .. " "
			end,

			-- 当前 buffer 加粗
			bold = function(buffer)
				return buffer.is_focused
			end,
		},

		-- ④ 修改标记
		{
			text = function(buffer)
				-- 文件被修改时显示 ●
				if buffer.is_modified then
					return "●"
				end

				return ""
			end,

			-- 修改标记使用警告颜色
			fg = function()
				return vim.api.nvim_get_hl(0, {
					name = "DiagnosticWarn",
					link = false,
				}).fg
			end,
		},


		-- ⑤ 关闭按钮
		{
			text = "",
			-- text = " 󰅖",

			-- 鼠标左键关闭 buffer
			on_click = function(_, _, _, _, buffer)
				buffer:delete()
			end,

			-- 关闭按钮使用 Comment 颜色
			fg = function()
				return vim.api.nvim_get_hl(0, {
					name = "Comment",
					link = false,
				}).fg
			end,
		},


		-- ⑥ 右侧空格
		{
			text = " ",
		},
	},
	-- false = 不显示 Vim Tab page
	tabs = false,
})

local map = vim.keymap.set

map("n", "<Bar>", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "\\", "<Plug>(cokeline-focus-next)", { silent = true })
map("n", "<Leader><Tab>p", "<Plug>(cokeline-switch-prev)", { desc = "当前 Buffer 向左移动", silent = true })
map("n", "<Leader><Tab>n", "<Plug>(cokeline-switch-next)", { desc = "当前 Buffer 向右移动", silent = true })

for i = 1, 9 do
	map(
		"n",
		("<leader>%s"):format(i),
		("<Plug>(cokeline-focus-%s)"):format(i),
		{ desc = "切换到 buffer " .. i, silent = true }
	)
	map(
		"n",
		("<leader><Tab>%s"):format(i),
		("<Plug>(cokeline-switch-%s)"):format(i),
		{ desc = ("移动 buffer 到第 %s 个位置"):format(i), silent = true }
	)
end
