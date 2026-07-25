vim.api.nvim_create_autocmd("UIEnter", {
    group = vim.api.nvim_create_augroup("SetupNeotree", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            {
                src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
                version = vim.version.range('3')
            }
        })

        local map = vim.keymap.set
        local tree = require("neo-tree")
        map({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle reveal source=filesystem<cr>",
            { desc = "文件浏览器", noremap = true, silent = true })
        map("n", "<c-e>", "<cmd>Neotree toggle reveal float git_status<cr>",
            { desc = "git", noremap = true, silent = true })

        tree.setup({
            window = {
                mappings = {

                },
                width = 30
            },
            default_component_configs = {
                indent = {
                    indent_size = 2,
                    padding = 1, -- extra padding on left hand side
                    -- indent guides
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                    -- expander config, needed for nesting files
                    with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        })
    end,
})
