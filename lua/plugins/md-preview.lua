vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("SetupMp", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.cmd.packadd("markdown-preview.nvim")

        vim.pack.add({
            gh("iamcco/markdown-preview.nvim"),
        })

        vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>",
            { desc = "预览 MD", noremap = true, silent = true })
    end,
})

-- vim.api.nvim_create_autocmd("CmdUndefined", {
--     pattern = {
--         "MarkdownPreview",
--         "MarkdownPreviewToggle",
--         "MarkdownPreviewStop",
--     },

--     callback = function()
--         vim.cmd.packadd("markdown-preview.nvim")
--     end,
-- })
