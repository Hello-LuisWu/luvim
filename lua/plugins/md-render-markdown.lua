vim.pack.add({
    "https://github.com/MeanderingProgrammer/render-markdown.nvim"
})
-- local loaded = false
-- local function load_RenderMd()
--     if loaded then
--         return
--     end
--     loaded = true

    require('render-markdown').setup({
        enabled = false
    })
-- end

vim.api.nvim_create_autocmd("filetype", {
    group = vim.api.nvim_create_augroup("setupRenderMd", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<leader>md",
            function()
                -- load_RenderMd()
                vim.cmd("RenderMarkdown toggle")
            end,
            { desc = "nvim 内部预览 md", noremap = true, silent = true })
    end
})
