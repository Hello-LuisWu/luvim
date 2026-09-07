local group = vim.api.nvim_create_augroup("setupIndentscope", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
--     group = group,
--     -- once = true,
--     callback = function()
--         -- 已加载则跳过
--         if package.loaded["ibl"] then
--             vim.api.nvim_del_augroup_by_id(group)
--             return
--         end

        vim.pack.add({
            -- {
            --     src = "https://github.com/echasnovski/mini.indentscope",
            --     version = "stable"
            -- },
            "https://github.com/lukas-reineke/indent-blankline.nvim"
        })

        local highlight = {
            "RainbowRed",
            -- "RainbowCyan",
            -- "RainbowYellow",
            -- "RainbowBlue",
            -- "RainbowOrange",
            -- "RainbowGreen",
            -- "RainbowViolet",
        }
        require("ibl").setup({
            debounce = 300,
            scope = {
                enabled = false,
            },
        })
--         vim.api.nvim_del_augroup_by_id(group)
--     end
-- })
