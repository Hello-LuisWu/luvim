-- NOTE: 彩虹括号
local loaded = false
local function load_rainbow()
    if loaded then
        return
    end
    loaded = true
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
end


vim.api.nvim_create_autocmd({ 'bufreadpre', 'bufnewfile' }, {
    group = vim.api.nvim_create_augroup("setupRainbow", { clear = true }),
    once = true,
    callback = load_rainbow
})
