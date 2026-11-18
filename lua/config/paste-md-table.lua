-- local vim = vim

-- -- 将剪贴板中的 TSV 转换为 Markdown 表格
-- local function clipboard_to_markdown()
-- 	-- 读取系统剪贴板
-- 	local clipboard = vim.fn.getreg("+", 1, true)

-- 	if not clipboard or #clipboard == 0 then
-- 		vim.notify("剪贴板为空", vim.log.levels.WARN)
-- 		return
-- 	end

-- 	-- 合并剪贴板内容
-- 	local content = table.concat(clipboard, "\n")

-- 	-- 按行拆分
-- 	local rows = {}

-- 	for line in (content .. "\n"):gmatch("(.-)\n") do
-- 		line = line:gsub("\r$", "")

-- 		if line ~= "" then
-- 			local cells = {}

-- 			-- 按 Tab 拆分单元格
-- 			for cell in (line .. "\t"):gmatch("(.-)\t") do
-- 				cell = vim.trim(cell)

-- 				-- 转义 Markdown 管道符
-- 				cell = cell:gsub("|", "\\|")

-- 				table.insert(cells, cell)
-- 			end

-- 			table.insert(rows, cells)
-- 		end
-- 	end

-- 	if #rows == 0 then
-- 		vim.notify("没有找到有效表格", vim.log.levels.WARN)
-- 		return
-- 	end

-- 	-- 检查是否包含 Tab 分隔符
-- 	if not content:find("\t") then
-- 		vim.notify("剪贴板不是 Tab 分隔的表格", vim.log.levels.WARN)
-- 		return
-- 	end

-- 	-- 获取最大列数
-- 	local max_cols = 0

-- 	for _, row in ipairs(rows) do
-- 		max_cols = math.max(max_cols, #row)
-- 	end

-- 	-- 补齐空单元格
-- 	for _, row in ipairs(rows) do
-- 		for i = #row + 1, max_cols do
-- 			row[i] = ""
-- 		end
-- 	end

-- 	-- 构建 Markdown 表格
-- 	local result = {}

-- 	for i, row in ipairs(rows) do
-- 		table.insert(result, "| " .. table.concat(row, " | ") .. " |")

-- 		-- 第一行后插入 Markdown 分隔线
-- 		if i == 1 then
-- 			local separator = {}

-- 			for _ = 1, max_cols do
-- 				table.insert(separator, "---")
-- 			end

-- 			table.insert(result, "| " .. table.concat(separator, " | ") .. " |")
-- 		end
-- 	end

-- 	-- 插入到当前光标所在行下方
-- 	vim.api.nvim_put(result, "l", true, true)

-- 	vim.notify("已转换为 Markdown 表格", vim.log.levels.INFO)
-- end

-- -- 快捷键
-- vim.keymap.set("n", "<leader>mb", clipboard_to_markdown, {
-- 	desc = "剪贴板转 Markdown 表格",
-- })
