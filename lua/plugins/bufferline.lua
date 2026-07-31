-- NOTE: p: buffer 标签页

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup("SetupBuffweline", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            gh("akinsho/bufferline.nvim"),
        })

        require("bufferline").setup({
            options = {
                -- buffer 模式
                mode = "buffers",
                -- 样式
                style_preset = require("bufferline").style_preset.default,
                -- 显示编号
                numbers = "ordinal",
                -- numbers = "none",
                -- 左键切换
                left_mouse_command = "buffer %d",
                -- 中键关闭
                middle_mouse_command = "bdelete! %d",
                -- 右键关闭
                right_mouse_command = "bdelete! %d",
                -- 当前 buffer 标记
                indicator = {
                    icon = "▎",
                    style = "icon",
                },
                -- 图标
                buffer_close_icon = "󰅖",
                close_icon = "",
                modified_icon = "●",
                -- buffer 名称长度
                max_name_length = 15,
                max_prefix_length = 20,

                diagnostics = false,

                -- 显示文件图标
                show_buffer_icons = false,

                -- 显示关闭按钮
                show_buffer_close_icons = false,

                show_close_icon = false,

                -- tab 分割样式
                separator_style = "slant",

                -- 总是显示
                always_show_bufferline = true,

                -- 鼠标悬停显示关闭按钮
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {
                        "close"
                    },
                },

                -- 自动排序
                sort_by = "insert_after_current",

                -- 过滤特殊 buffer
                custom_filter = function(buf_number)
                    local filetype =
                        vim.bo[buf_number].filetype

                    -- 不显示这些
                    local ignore = {
                        "qf",
                        "help",
                        "NvimTree",
                        "neo-tree",
                    }

                    for _, ft in ipairs(ignore) do
                        if filetype == ft then
                            return false
                        end
                    end


                    return true
                end,
                -- 文件树偏移
                offsets = {

                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },

                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },

                },

                -- 选择模式
                pick = {
                    alphabet =
                    "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
                },

            }
        })

        vim.keymap.set("n", "<leader><Tab>c", "<cmd>bdelete<CR>", { desc = "关闭当前 buffer", })

        vim.keymap.set("n", "<leader><Tab>C", "<cmd>bdelete!<CR>", { desc = "强制关闭当前 buffer", })

        -- 关闭左右 buffer
        vim.keymap.set("n", "<leader><Tab>]", "<cmd>BufferLineCloseRight<CR>", { desc = "关闭右侧所有 buffer", })
        vim.keymap.set("n", "<leader><Tab>[", "<cmd>BufferLineCloseLeft<CR>", { desc = "关闭左侧所有 buffer", })
        vim.keymap.set("n", "<leader><Tab>o", "<cmd>BufferLineCloseOthers<CR>", { desc = "关闭其他 buffer", })

        -- buffer 固定
        vim.keymap.set("n", "<leader><Tab>p", "<cmd>BufferLineTogglePin<CR>", { desc = "固定/取消固定 buffer", })

        -- 快速选择
        vim.keymap.set("n", "<leader><Tab>B", "<cmd>BufferLinePickClose<CR>", { desc = "用字符关闭 buffer", })
        vim.keymap.set("n", "<leader><Tab>b", "<cmd>BufferLinePick<CR>", { desc = "用字符跳转 buffer", })

        -- buffer 切换
        vim.keymap.set("n", "<leader><Tab>h", "<cmd>BufferLineCyclePrev<CR>", { desc = "上一个 buffer", })

        vim.keymap.set("n", "<leader><Tab>l", "<cmd>BufferLineCycleNext<CR>", { desc = "下一个 buffer", })

        -- buffer 移动
        vim.keymap.set("n", "<leader><Tab>L", "<cmd>BufferLineMoveNext<CR>", { desc = "向右移动 buffer", })

        vim.keymap.set("n", "<leader><Tab>H", "<cmd>BufferLineMovePrev<CR>", { desc = "向左移动 buffer", })

        -- 跳转 buffer 1-9
        for i = 1, 9 do
            vim.keymap.set(
                "n",
                "<leader><Tab>" .. i,
                "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
                {
                    desc = "切换到第 " .. i .. " 个 buffer",
                }
            )
        end

        -- 最后一个 buffer
        vim.keymap.set("n", "<leader><Tab>$", "<cmd>BufferLineGoToBuffer -1<CR>", {
            desc = "切换到最后一个 buffer",
        })
    end,
})
