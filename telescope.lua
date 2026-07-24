vim.api.nvim_create_autocmd("UIEnter", {
    group = vim.api.nvim_create_augroup("SetupTelescope", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            "https://www.github.com/nvim-telescope/telescope.nvim",
            {
                src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
                data = {
                    post_checkout = function(plugin)
                        vim.system(
                            { "make" },
                            { cwd = plugin.path }
                        ):wait()
                    end,
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '查找文件' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '查找字符' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '查找 buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '查找帮助' })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '历史文件' })
        vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = '查找主题' })
        --       vim.keymap.set('n', '<leader>fm', builtin.lsp_references, { desc = 'Telescope commands' })
    end,

})
