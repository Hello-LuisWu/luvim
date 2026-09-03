-- NOTE: p: 注释

-- 创建一个自动命令组
-- 使用固定名称可以避免重复创建自动命令时产生多个相同配置
local group = vim.api.nvim_create_augroup("setupComment", {
    clear = true, -- 创建时清除该组中之前存在的自动命令
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = group,
    -- once = true,
    callback = function(args)
        local buf = args.buf

        -- 只处理普通、可写文件
        if vim.bo[buf].buftype ~= ""
            or not vim.bo[buf].modifiable
            or vim.bo[buf].readonly
        then
            return
        end

        -- 已加载则跳过
        if package.loaded["Comment"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end

        ---------------------------------------------------------------------
        -- 内容区:


        -- 只处理可修改、非只读的 Buffer
        vim.pack.add({
            "https://github.com/numToStr/Comment.nvim",
        })

        local comment = require("Comment")

        comment.setup({
            padding = true,
            sticky = true,
            ignore = "^$",

            toggler = {
                line = "<C-\\>",
                block = "<leader>\\",
            },

            opleader = {
                line = "<C-\\>",
                block = "<leader>\\",
            },

            extra = {
                above = "<leader>ck",
                below = "<leader>cj",
                eol = "<leader>ca",
            },

            mappings = {
                basic = true,
                extra = true,
            },

            post_hook = nil,
        })

        -- 🧠 插入签名块
        local function insert_signature()
            -- 获取注释前缀
            local ft = require("Comment.ft")
            local cmt = ft.get(vim.bo.filetype)
            local comment_prefix = ""

            if type(cmt) == "string" then
                comment_prefix = cmt:gsub("%%s", ""):gsub("%s+$", "") .. " "
            elseif type(cmt) == "table" then
                comment_prefix = (cmt[1] or "#"):gsub("%%s", ""):gsub("%s+$", "") .. " "
            else
                comment_prefix = "# "
            end

            local date = os.date("%Y-%m-%d %H:%M")
            local filepath = vim.fn.expand("%:p")
            local uname = vim.loop.os_uname()
            local sysinfo = uname.sysname .. " " .. uname.release

            local lines = {
                comment_prefix
                .. "------------------------------------------------------------------------------",
                comment_prefix .. "Author   : Luis Wu",
                comment_prefix .. "Editor   : Neovim",
                comment_prefix .. "Date     : " .. date,
                comment_prefix .. "Position : " .. filepath,
                comment_prefix .. "System   : " .. sysinfo,
                comment_prefix
                .. "------------------------------------------------------------------------------",
            }

            vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
            vim.notify("✅ 签名已插入", vim.log.levels.INFO)
        end

        -- 🧠 更新日期
        local function update_signature_date()
            local new_date = os.date("%Y-%m-%d %H:%M")
            local lines = vim.api.nvim_buf_get_lines(0, 0, 20, false)
            for i, line in ipairs(lines) do
                if line:match("Date%s*:") then
                    local new_line = line:gsub("Date%s*:%s*.*", "Date     : " .. new_date)
                    vim.api.nvim_buf_set_lines(0, i - 1, i, false, { new_line })
                    vim.notify("✔ 日期已更新: " .. new_date, vim.log.levels.INFO)
                    return
                end
            end
            vim.notify("⚠ 未找到 Date 行", vim.log.levels.WARN)
        end
        -- ⌨️ 快捷键（推荐使用 <leader>si / <leader>sd）
        vim.keymap.set("n", "<leader>zi", insert_signature, { desc = "插入签名信息" })
        vim.keymap.set("n", "<leader>zu", update_signature_date, { desc = "更新签名日期" })

        --------------------------------------------------------------------------------------------
        -- 优化点 3：加载成功后立即清除当前自动命令组
        -- 确保整个插件生命周期内，这段逻辑只运行一次成功加载过程
        vim.api.nvim_del_augroup_by_id(group)
    end,
})
