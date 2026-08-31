vim.pack.add({
    "https://github.com/iamcco/markdown-preview.nvim"
})

vim.api.nvim_create_autocmd("filetype", {
    group = vim.api.nvim_create_augroup("setupmp", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.cmd.packadd("markdown-preview.nvim")

        vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>",
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
