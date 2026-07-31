vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("SetupImgClip", { clear = true }),
    pattern = {
        "markdown",
    },
    callback = function()
        vim.pack.add({
            gh("HakonHarnes/img-clip.nvim")
        })


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
    end
})
