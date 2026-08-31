-- NOTE: p: 成对符号补齐
vim.pack.add({
    "https://github.com/windwp/nvim-autopairs",
})
vim.api.nvim_create_autocmd({ "insertenter", }, {
    group = vim.api.nvim_create_augroup("SetupAutopairs", { clear = true }),
    once = true,
    callback = function()
        require("nvim-autopairs").setup({})
    end,

})
