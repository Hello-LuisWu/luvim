vim.api.nvim_create_autocmd({ 'UIEnter' }, {
    group = vim.api.nvim_create_augroup("SetupMason", { clear = true }),
    once = true,
    callback = function()
    end,
})
