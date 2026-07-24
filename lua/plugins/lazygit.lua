vim.api.nvim_create_autocmd("UIEnter", {
    group = vim.api.nvim_create_augroup("SetupLaztgit", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            'https://github.com/kdheepak/lazygit.nvim',
        })
    end,
})
