-- ------------------------------------------------------------------------------
-- Author   : Luis Wu
-- Editor   : Neovim
-- Date     : 2026-07-31 16:49
-- Position : /Users/luis/.config/nvim/lua/plugins/comment.lua
-- System   : Darwin 25.2.0
-- ------------------------------------------------------------------------------

-- NOTE: p: 注释

vim.api.nvim_create_autocmd({ 'bufreadpre', 'bufnewfile' }, {
    group = vim.api.nvim_create_augroup("setupComment", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            gh("numToStr/Comment.nvim"),
        })

        local comment = require("Comment")

        -- 配置 comment.nvim
        comment.setup({
            -- 基础配置
            padding = true, -- 在注释符号和内容之间添加空格（例如 "// 内容" vs "//内容"）
            sticky = true,  -- 注释后保持光标位置不变（NORMAL 模式下有效）
            ignore = "^$",  -- 忽略空行（不注释空行）

            -- 快捷键映射配置
            toggler = {
                line = "<C-\\>",      -- NORMAL 模式：切换单行注释（默认：gcc）
                block = "<leader>\\", -- NORMAL 模式：切换块注释（默认：gbc）
            },
            opleader = {
                line = "<C-\\>",      -- NORMAL/VISUAL 模式：操作符模式行注释（默认：gc + 文本对象）
                block = "<leader>\\", -- NORMAL/VISUAL 模式：操作符模式块注释（默认：gb + 文本对象）
            },
            extra = {
                above = "<leader>ck", -- 在当前行上方插入注释并进入 INSERT 模式
                below = "<leader>cj", -- 在当前行下方插入注释并进入 INSERT 模式
                eol = "<leader>ca",   -- 在行尾插入注释并进入 INSERT 模式
            },

            -- 映射启用配置
            mappings = {
                basic = true, -- 启用基础快捷键（gc/gb/gcc/gbc 等）
                extra = true, -- 启用额外快捷键（gcO/gco/gcA）
            },
            ---Function to call before (un)comment
            --  pre_hook = nil,
            ---Function to call after (un)comment
            post_hook = nil,
            --     pre_hook = function(ctx)
            --         -- 如果是 JSON 文件，强制使用 '//' 注释
            --         if vim.bo.filetype == "json" then
            --             return {
            --                 line = "//%s", -- 单行注释符号（%s 表示注释内容占位）
            --                 block = nil    -- JSON 不支持块注释
            --             }
            --         end
            --     end,
        })

        -- 手动设置 JSON 的注释符号（覆盖默认配置）
        local fts = require("Comment.ft")

        -- 设置 JSON 和 JSONC 的注释符号
        --      ft.set("json", "//%s")                -- 纯 JSON 用单行注释
        fts.set("jsonc", { "//%s", "/*%s*/" }) -- JSONC 支持行和块注释

        -- 自动识别 .json 为 jsonc（可选）
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = "*.json",
            callback = function() vim.bo.filetype = "jsonc" end,
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
    end,
})
