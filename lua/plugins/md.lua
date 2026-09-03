local group = vim.api.nvim_create_augroup("SetupMD", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = {
        "markdown",
    },
    callback = function()
        -- ：防止重复加载
        if package.loaded["autolist"] then
            vim.api.nvim_del_augroup_by_id(group)
            return
        end

        vim.pack.add({
            "https://github.com/gaoDean/autolist.nvim",
            "https://github.com/iamcco/markdown-preview.nvim",
            "https://github.com/HakonHarnes/img-clip.nvim",
            "https://github.com/Kicamon/markdown-table-mode.nvim",
            "https://github.com/richardbizik/nvim-toc",
            "https://github.com/MeanderingProgrammer/render-markdown.nvim"
        })

        -- ---------------------------------------------------------------------
        -- 1. render-markdown (美化渲染)
        -- ---------------------------------------------------------------------
        require('render-markdown').setup({
            enabled = false
        })
        vim.keymap.set("n", "<leader>md",
            function()
                -- load_RenderMd()
                vim.cmd("RenderMarkdown toggle")
            end,
            { desc = "nvim 内部预览 md", noremap = true, silent = true })

        -- ---------------------------------------------------------------------
        -- 2. nvim-toc (目录生成)
        -- ---------------------------------------------------------------------
        require("nvim-toc").setup({
            toc_header = "目录"
        })

        -- ---------------------------------------------------------------------
        -- 3. markdown-table-mode (表格助手)
        -- ---------------------------------------------------------------------
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

        -- ---------------------------------------------------------------------
        -- 4. img-clip (剪贴板粘贴图片)
        -- ---------------------------------------------------------------------
        require("img-clip").setup({
            -- 默认配置
            default = {
                -- 图片保存目录
                dir_path = "./imgs",

                -- 图片命名
                file_name = "%y%m%d-%H%M%S",
                use_absolute_path = false,
                copy_images = true,
                prompt_for_file_name = false,
                extension = "avif",
                process_cmd = "magick convert - -quality 75 avif:-",
                formats = { "jpeg", "jpg", "png" },

            },
        })
        vim.keymap.set("n", "<leader>mi", "<cmd>PasteImage<cr>", { desc = "粘贴图片", noremap = true, silent = true })

        -- ---------------------------------------------------------------------
        -- 5. markdown-preview (浏览器同步预览)
        -- ---------------------------------------------------------------------
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_close = true
        vim.g.mkdp_port = "8888"

        -- 2. 安装依赖
        -- vim.fn["mkdp#util#install"]()
        vim.keymap.set("n", "<leader>mp", function()
            vim.cmd("MarkdownPreviewToggle")
        end, {
            buffer = true,
            desc = "Markdown 预览",
        })

        -- ---------------------------------------------------------------------
        -- 6. autolist (智能列表管理)
        -- ---------------------------------------------------------------------
        -- vim.cmd.packadd("autolist.nvim")
        require("autolist").setup()

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

        vim.api.nvim_del_augroup_by_id(group)
    end,
})
