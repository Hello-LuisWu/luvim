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
            local icon = "󰌒 "
            return icon .. size
        end
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "diagnosticsColor", { bg = "NONE", fg = "NONE" })

        --[[ local transparent = {
            normal = {
                a = { fg = "NONE", bg = "NONE" },
                b = { fg = "NONE", bg = "NONE" },
                c = { fg = "NONE", bg = "NONE" },
                x = { fg = "NONE", bg = "NONE" },
                y = { fg = "NONE", bg = "NONE" },
                z = { fg = "NONE", bg = "NONE" },
            },
            insert = {
                a = { fg = "NONE", bg = "NONE" },
                b = { fg = "NONE", bg = "NONE" },
                c = { fg = "NONE", bg = "NONE" },
                x = { fg = "NONE", bg = "NONE" },
                y = { fg = "NONE", bg = "NONE" },
                z = { fg = "NONE", bg = "NONE" },
            },
            visual = {
                a = { fg = "NONE", bg = "NONE" },
                b = { fg = "NONE", bg = "NONE" },
                c = { fg = "NONE", bg = "NONE" },
                x = { fg = "NONE", bg = "NONE" },
                y = { fg = "NONE", bg = "NONE" },
                z = { fg = "NONE", bg = "NONE" },
            },
            replace = {
                a = { fg = "NONE", bg = "NONE" },
                b = { fg = "NONE", bg = "NONE" },
                c = { fg = "NONE", bg = "NONE" },
                x = { fg = "NONE", bg = "NONE" },
                y = { fg = "NONE", bg = "NONE" },
                z = { fg = "NONE", bg = "NONE" },
            },
            command = {
                a = { fg = "NONE", bg = "NONE" },
                b = { fg = "NONE", bg = "NONE" },
                c = { fg = "NONE", bg = "NONE" },
                x = { fg = "NONE", bg = "NONE" },
                y = { fg = "NONE", bg = "NONE" },
                z = { fg = "NONE", bg = "NONE" },
            },
            inactive = {
                a = { fg = "NONE", bg = "NONE" },
                b = { fg = "NONE", bg = "NONE" },
                c = { fg = "NONE", bg = "NONE" },
                x = { fg = "NONE", bg = "NONE" },
                y = { fg = "NONE", bg = "NONE" },
                z = { fg = "NONE", bg = "NONE" },
            },
        } ]]

        local tm = {}

        for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
            tm[mode] = {}
            for _, section in ipairs({ "a", "b", "c", "x", "y", "z" }) do
                tm[mode][section] = { bg = "NONE" }
            end
        end

        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = tm,
                -- component_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
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
                    {
                        'mode',
                        padding = 0,
                    }

                },
                lualine_b = {},
                lualine_c = { 'filename',
                    {
                        'diagnostics',
                        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                        always_visible = true,
                        color = { fg = 'green' },

                        diagnostics_color = {
                            -- Same values as the general color option can be used here.
                            error = 'diagnosticsColor', -- Changes diagnostics' error color.
                            warn  = 'diagnosticsColor', -- Changes diagnostics' warn color.
                            info  = 'diagnosticsColor', -- Changes diagnostics' info color.
                            hint  = 'diagnosticsColor', -- Changes diagnostics' hint color.
                        },
                    },
                },
                lualine_x = {
                    {
                        'lsp_status',
                        padding = 1,
                        -- icon = '', -- f013
                        icon = '', -- f013
                        symbols = {
                            -- Standard unicode symbols to cycle through for LSP progress:
                            -- spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            spinner = { '|', '/', '-', '\\', '|', '/', '-', '\\', '|', '/' },
                            -- Standard unicode symbol for when LSP is done:
                            done = "ok",
                            -- Delimiter inserted between LSP names:
                            separator = ' ',
                        },
                        -- List of LSP names to ignore (e.g., `null-ls`):
                        ignore_lsp = {},
                        -- Display the LSP name
                        show_name = true,
                    },

                    {
                        get_indent,
                        cond = function()
                            return vim.bo.filetype ~= ""
                        end,
                        padding = { left = 1, right = 0 },
                    },

                    {
                        'encoding',
                        padding = { left = 1, right = 0 },
                    },
                    {
                        'fileformat',
                        padding = { left = 1, right = 0 },
                        symbols = {
                            unix = 'unix', -- e712
                            dos = 'dos',   -- e70f
                            mac = 'mac',   -- e711
                        }
                    },
                    -- '%y',
                    {
                        "filetype",
                        padding = { left = 1, right = 0 },
                        icons_enabled = false,
                    },

                    {
                        function()
                            -- 中文星期映射表
                            local weekday_map = { "日", "一", "二", "三", "四", "五", "六" }

                            -- 时钟 Emoji 表（0~23 点）
                            local clock_emoji = {
                                -- 整点（0-11）
                                "🕛", "🕐", "🕑", "🕒", "🕓", "🕔",
                                "🕕", "🕖", "🕗", "🕘", "🕙", "🕚",
                                -- 半点（0.5-11.5）
                                "🕧", "🕜", "🕝", "🕞", "🕟", "🕠",
                                "🕡", "🕢", "🕣", "🕤", "🕥", "🕦"
                            }

                            -- 十二时辰映射表
                            local shichen_map = {
                                "子", "丑", "寅", "卯", "辰", "巳",
                                "午", "未", "申", "酉", "戌", "亥"
                            }

                            local time = os.date("*t")
                            local hour = time.hour

                            local min = time.min

                            -- 计算时辰
                            local shichen_index = math.floor((hour + 1) % 24 / 2) + 1
                            local shichen = shichen_map[shichen_index]

                            -- 判断整点 or 半点
                            local is_half = min >= 30 and 1 or 0
                            -- 计算 emoji 索引：0点开始，整点在前（0~11），半点加上12
                            local emoji_index = ((hour % 12) + (is_half * 12)) + 1
                            local emoji = clock_emoji[emoji_index]

                            return string.format(
                            -- "%d/%d %s%s时 周%s",
                                "%d/%d %s周%s",
                                -- time.year,
                                time.month,
                                time.day,
                                -- time.hour,
                                -- time.min,
                                emoji,
                                -- shichen,
                                weekday_map[time.wday]
                            )
                        end,
                        padding = { left = 2, right = 1 },
                        -- separator = { left = "" }, -- 左侧分隔符
                        -- color = { gui = "italic" }, -- 颜色配置
                        -- color = {
                        --     bg = "#72b560",
                        --     fg = "#111111",
                        --     gui = "bold",
                        -- }

                    },
                },
                lualine_y = {
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
