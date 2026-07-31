vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup("SetupLualine", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            gh("nvim-lualine/lualine.nvim")
        })

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
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
                globalstatus = false,
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
                lualine_a = { --[[ 'mode' ]] },
                lualine_b = {},
                lualine_c = { 'filename', 'diagnostics' },
                lualine_x = {
                    'encoding',
                    {
                        'fileformat',
                        symbols = {
                            unix = 'u', -- e712
                            dos = 'd',  -- e70f
                            mac = 'm',  -- e711
                        }
                    },
                    '%Y',
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
                                "%d/%d %s%s时 周%s",
                                -- time.year,
                                time.month,
                                time.day,
                                emoji,
                                shichen,
                                weekday_map[time.wday]
                            )
                        end,
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
                    {
                        'lsp_status',
                        -- icon = '', -- f013
                        icon = '', -- f013
                        symbols = {
                            -- Standard unicode symbols to cycle through for LSP progress:
                            -- spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            spinner = { '|', '/', '-', '\\', '|', '/', '-', '\\', '|', '/' },
                            -- Standard unicode symbol for when LSP is done:
                            done = '*',
                            -- Delimiter inserted between LSP names:
                            separator = ' ',
                        },
                        -- List of LSP names to ignore (e.g., `null-ls`):
                        ignore_lsp = {},
                        -- Display the LSP name
                        show_name = true,
                    }
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
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
})
