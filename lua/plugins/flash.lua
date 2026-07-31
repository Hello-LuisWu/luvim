-- NOTE: p: 字符搜索跳转

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup("SetupFlash", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            gh("folke/flash.nvim"),
        })

        vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)
        vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end)
        vim.keymap.set("o", "r", function() require("flash").remote() end)
        vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end)
        vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end)

        require("flash").setup()
    end,
})
