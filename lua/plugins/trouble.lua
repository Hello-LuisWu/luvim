local group = vim.api.nvim_create_augroup("setupTrouble", {
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
        if package.loaded["trouble"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end

        ---------------------------------------------------------------------
        -- 内容区:

        vim.pack.add({
            "https://github.com/folke/trouble.nvim"
        })

        require("trouble").setup()
        local map = vim.keymap.set

        -- Trouble：诊断信息
        map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", {
            desc = "所有诊断列表",
        })

        -- Trouble：当前 Buffer 的诊断信息
        map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
            desc = "当前 Buffer 诊断",
        })

        -- Trouble：代码符号
        map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", {
            desc = "打开/关闭代码符号",
        })

        -- Trouble：LSP 定义、引用等
        map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {
            desc = "打开/关闭 LSP 定义与引用",
        })

        -- Trouble：位置列表
        map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", {
            desc = "打开/关闭位置列表",
        })

        -- Trouble：Quickfix 列表
        map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", {
            desc = "打开/关闭 Quickfix 列表",
        })

        --------------------------------------------------------------------------------------------
        -- 优化点 3：加载成功后立即清除当前自动命令组
        -- 确保整个插件生命周期内，这段逻辑只运行一次成功加载过程
        vim.api.nvim_del_augroup_by_id(group)
    end,
})
