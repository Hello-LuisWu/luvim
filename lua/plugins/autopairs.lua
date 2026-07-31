-- NOTE: p: 成对符号补齐

vim.api.nvim_create_autocmd({ "insertenter", }, {
    group = vim.api.nvim_create_augroup("SetupAutopairs", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            gh("windwp/nvim-autopairs"),
        })
        require("nvim-autopairs").setup({})
    end,

})
