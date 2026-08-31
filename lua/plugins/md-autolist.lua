vim.pack.add({
    "https://github.com/gaoDean/autolist.nvim"
})

local loaded = false

vim.api.nvim_create_autocmd("FileType", {

    group = vim.api.nvim_create_augroup(
        "SetupAutolist",
        { clear = true }
    ),

    pattern = {
        "markdown",
        "text",
    },

    callback = function()
        if loaded then
            return
        end


        vim.cmd.packadd("autolist.nvim")

        require("autolist").setup({})

        local opts = {
            buffer = true,
        }

        vim.keymap.set(
            "i",
            "<Tab>",
            "<cmd>AutolistTab<cr>",
            opts
        )

        vim.keymap.set(
            "i",
            "<S-Tab>",
            "<cmd>AutolistShiftTab<cr>",
            opts
        )

        vim.keymap.set(
            "i",
            "<CR>",
            "<CR><cmd>AutolistNewBullet<cr>",
            opts
        )

        vim.keymap.set(
            "n",
            "o",
            "o<cmd>AutolistNewBullet<cr>",
            opts
        )

        vim.keymap.set(
            "n",
            "O",
            "O<cmd>AutolistNewBulletBefore<cr>",
            opts
        )

        vim.keymap.set(
            "n",
            "<CR>",
            "<cmd>AutolistToggleCheckbox<cr><CR>",
            opts
        )

        vim.keymap.set(
            "n",
            "<C-r>",
            "<cmd>AutolistRecalculate<cr>",
            opts
        )

        vim.keymap.set(
            "n",
            "<leader>cn",
            require("autolist").cycle_next_dr,
            {
                buffer = true,
                expr = true,
            }
        )

        vim.keymap.set(
            "n",
            "<leader>cp",
            require("autolist").cycle_prev_dr,
            {
                buffer = true,
                expr = true,
            }
        )

        vim.keymap.set(
            "n",
            ">>",
            ">><cmd>AutolistRecalculate<cr>",
            opts
        )


        vim.keymap.set(
            "n",
            "<<",
            "<<<cmd>AutolistRecalculate<cr>",
            opts
        )

        loaded = true
    end,
})
