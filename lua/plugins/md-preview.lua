vim.g.mkdp_filetypes = { "markdown" }


vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",

    callback = function()
        vim.cmd.packadd("markdown-preview.nvim")

        vim.pack.add({
            {
                src = "https://github.com/iamcco/markdown-preview.nvim",
            },
        })
    end,
})

vim.api.nvim_create_autocmd("CmdUndefined", {
    pattern = {
        "MarkdownPreview",
        "MarkdownPreviewToggle",
        "MarkdownPreviewStop",
    },

    callback = function()
        vim.cmd.packadd("markdown-preview.nvim")
    end,
})
