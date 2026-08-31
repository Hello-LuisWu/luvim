-- NOTE: p: 自动补全
vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range('1'),
    },
})
vim.api.nvim_create_autocmd({ "insertenter", "cmdlineenter" }, {
    group = vim.api.nvim_create_augroup("setupBlinkCmp", { clear = true }),
    once = true,
    callback = function()
        require("blink.cmp").setup({
            appearance = {
                highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = false,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono',
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer'
                    -- 'ripgrep'
                },
                providers = {
                    buffer = {
                        score_offset = 1
                    },
                    path = {
                        score_offset = 2
                    },
                    lsp = {
                        score_offset = 0
                    },
                    cmdline = {
                        module = 'blink.cmp.sources.cmdline',
                        -- 禁用windows上的shell命令，因为它们会导致neovim挂起
                        enabled = function()
                            return vim.fn.has('win32') == 0
                                or vim.fn.getcmdtype() ~= ':'
                                or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
                        end,
                    }
                },
                per_filetype = {
                    lua = { inherit_defaults = true, 'lsp', 'path' },
                    sql = { 'dadbod' },
                },
                transform_items = function(_, items) return items end,
                min_keyword_length = 0,
            },


            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'none',
                -- preset = "none",
                ["<C-\\>"] = { "show", "accept" },
                -- ["<C-\\>"] = { "show", "show_documentation", "hide_documentation" },
                -- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
                -- ["<CR>"] = { "accept", "fallback" },                          -- 更改成'select_and_accept'会选择第一项插入
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" }, -- 同时存在补全列表和snippet时，补全列表选择优先级更高

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                ["<C-e>"] = { "snippet_forward", "select_next", "fallback" }, -- 同时存在补全列表和snippet时，snippet跳转优先级更高
                ["<C-u>"] = { "snippet_backward", "select_prev", "fallback" },
            },

        })
    end,
})
