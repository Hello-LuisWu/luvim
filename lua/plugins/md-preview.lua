vim.pack.add({
    "https://github.com/iamcco/markdown-preview.nvim"
})

vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_auto_close = true
vim.g.mkdp_open_to_the_world = false
vim.g.mkdp_open_ip = "127.0.0.1"
vim.g.mkdp_port = "8888"
vim.g.mkdp_browser = ""
vim.g.mkdp_echo_preview_url = true
vim.g.mkdp_page_title = "${name}"

vim.api.nvim_create_autocmd("filetype", {
    group = vim.api.nvim_create_augroup("setupmp", { clear = true }),
    pattern = "markdown",
    callback = function()
        -- 2. 安装依赖

        vim.cmd.packadd("markdown-preview.nvim")
        vim.keymap.set("n", "<leader>mp",
            function()
                vim.fn["mkdp#util#install"]()
                vim.cmd("MarkdownPreviewToggle")
            end,
            { desc = "markdown 预览", noremap = true, silent = true, buffer = true })
    end,
})
