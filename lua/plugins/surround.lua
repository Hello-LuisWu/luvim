local group = vim.api.nvim_create_augroup("setupSurround", { clear = true })
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
        if package.loaded["nvim-surround"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end




        vim.pack.add({
            {
                src = "https://github.com/kylechui/nvim-surround",
                version = vim.version.range("4.x") -- Use for stability; omit to use `main` branch for the latest features
            },
        })

        require("nvim-surround").setup({
            surrounds = {
                ["i"] = {
                    add = {
                        "*",
                        "*"
                    }
                },
                ["j"] = {
                    add = {
                        "**",
                        "**"
                    }
                },
                ["h"] = {
                    add = {
                        "***",
                        "***"
                    }
                },
                ["u"] = {
                    add = {
                        "<u>",
                        "</u>"
                    }
                },
                ["d"] = {
                    add = {
                        "```",
                        "```"
                    }
                },
                ["s"] = {
                    add = {
                        "~~",
                        "~~"
                    }
                },
            },
        })

        vim.keymap.set("o", "[", "iw[")
        vim.keymap.set("o", "]", "iw]")
        vim.keymap.set("o", "<", "iw<")
        vim.keymap.set("o", ">", "iw>")
        vim.keymap.set("o", "(", "iw(")
        vim.keymap.set("o", ")", "iw)")
        vim.keymap.set("o", "{", "iw{")
        vim.keymap.set("o", "}", "iw}")
        vim.keymap.set("o", "'", "iw'")
        vim.keymap.set('o', '"', 'iw"')

        local map = vim.keymap.set

        -- Normal 模式 添加
        map("n", "<leader>ka", "<Plug>(nvim-surround-normal)", {
            desc = "根据动作范围添加包围符号",
        })

        map("n", "<leader>kA", "<Plug>(nvim-surround-normal-cur)", {
            desc = "给当前行添加包围符号",
        })

        map("n", "<leader>kl", "<Plug>(nvim-surround-normal-line)", {
            desc = "根据动作范围添加包围符号，并换行显示",
        })

        map("n", "<leader>kL", "<Plug>(nvim-surround-normal-cur-line)", {
            desc = "给当前行添加包围符号，并换行显示",
        })


        -- Visual 模式 添加
        map("x", "<leader>ka", "<Plug>(nvim-surround-visual)", {
            desc = "给选中文本添加包围符号",
        })

        map("x", "<leader>kl", "<Plug>(nvim-surround-visual-line)", {
            desc = "给选中文本添加包围符号，并换行显示",
        })


        -- 删除
        map("n", "<leader>kd", "<Plug>(nvim-surround-delete)", {
            desc = "删除包围符号",
        })


        -- 修改
        map("n", "<leader>kc", "<Plug>(nvim-surround-change)", {
            desc = "修改包围符号",
        })

        map("n", "<leader>kC", "<Plug>(nvim-surround-change-line)", {
            desc = "修改包围符号，并换行显示",
        })

        vim.api.nvim_del_augroup_by_id(group)
    end,
})
