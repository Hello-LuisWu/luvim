-- NOTE: p: 成对符号补齐

local group = vim.api.nvim_create_augroup("setupAutopairs", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
    group = group,
    callback = function(args)
        local buf = args.buf

        -- 防止重复加载
        if package.loaded["nvim-autopairs"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end

        -- 只在普通文件、可修改、非只读的缓冲区内触发
        -- if vim.bo[buf].buftype ~= ""
        --     or not vim.bo[buf].modifiable
        --     or vim.bo[buf].readonly
        -- then
        --     return
        -- end

        -----------------------------------------------------------------------
        -- 内容区:


        -- 加载插件
        vim.pack.add({
            "https://github.com/windwp/nvim-autopairs",
        })

        -- 配置插件
        require("nvim-autopairs").setup({
            check_ts = true,
        })

        -----------------------------------------------------------------------
        -- 插件已经加载，删除 autocmd
        vim.api.nvim_del_augroup_by_id(group)
    end,
})
