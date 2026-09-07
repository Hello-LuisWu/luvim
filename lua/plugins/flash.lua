-- NOTE: p: 字符搜索跳转

-- 创建一个自动命令组
-- 使用固定名称可以避免重复创建自动命令时产生多个相同配置
local group = vim.api.nvim_create_augroup("setupFlash", { clear = true, })
vim.api.nvim_create_autocmd('VimEnter', {
    group = group,
    -- once = true,
    callback = function()
        -- 已加载则跳过
        if package.loaded["flash"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end

        ---------------------------------------------------------------------
        -- 内容区:
        vim.pack.add({
            "https://github.com/folke/flash.nvim",
        })

        vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
            group = vim.api.nvim_create_augroup("SetupFlash", { clear = true }),
            once = true,
            callback = function()
                vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)
                vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end)
                vim.keymap.set("o", "r", function() require("flash").remote() end)
                vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
                vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end)

                require("flash").setup()
            end,
        })

        --------------------------------------------------------------------------------------------
        -- 优化点 3：加载成功后立即清除当前自动命令组
        -- 确保整个插件生命周期内，这段逻辑只运行一次成功加载过程
        vim.api.nvim_del_augroup_by_id(group)
    end,
})
