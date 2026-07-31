vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("SetupMdTableMode", { clear = true }),
    pattern = { "markdown", "text" },
    once = true,
    callback = function()
        vim.pack.add({
            gh("Kicamon/markdown-table-mode.nvim")
        })

        require('markdown-table-mode').setup({
            -- filetype = {
            --     '*.md',
            -- },
            options = {
                insert = true,              -- when typing "|"
                insert_leave = true,        -- when leaving insert
                pad_separator_line = false, -- add space in separator line
                alig_style = 'default',     -- default, left, center, right
            },
        })
        vim.keymap.set("n", "<leader>mt", "<cmd>Mtm<cr>")
    end,
})
