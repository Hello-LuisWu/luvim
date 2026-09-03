vim.pack.add({
    "https://github.com/richardbizik/nvim-toc"
})

-- vim.api.nvim_create_autocmd("filetype", {
--     group = vim.api.nvim_create_augroup("setupmp", { clear = true }),
--     pattern = "markdown",
--     callback = function()
        require("nvim-toc").setup({
              toc_header = "目录"
        })
--     end,
-- })
