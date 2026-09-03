-- NOTE: 彩虹括号

local group = vim.api.nvim_create_augroup("setupRainbow", { clear = true })
vim.api.nvim_create_autocmd({ 'bufreadpre', 'bufnewfile' }, {
    group = group,
    once = true,
    callback = function()

        -- 已加载则跳过
        if package.loaded["rainbow_delimiters.nvim"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end



        vim.pack.add({
            "https://github.com/HiPhish/rainbow-delimiters.nvim",
        })

        vim.cmd.packadd("rainbow-delimiters.nvim")

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = 'rainbow-delimiters.strategy.global',
                vim = 'rainbow-delimiters.strategy.local',
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            priority = {
                [''] = 110,
                lua = 210,
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }

        vim.api.nvim_del_augroup_by_id(group)
    end
})
