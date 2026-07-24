vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    }
})

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
    once = true,
    callback = function()
        local ts = require("nvim-treesitter")

        ts.setup({
            install_dir = vim.fn.stdpath('data') .. '/site'
        })

        ts.install({
            "bash",
            "c",
            "cpp",
            "css",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "vim",
            "vimdoc",
            "yaml",
        })

        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
    end,
})

--------------------------------------------------
-- Treesitter 高亮
--------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "vim",
        "yaml",
    },

    callback = function()
        vim.treesitter.start()
    end,
})

--------------------------------------------------
-- Treesitter 缩进（实验功能）
--------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "python",
        "javascript",
        "rust",
        "c",
        "cpp",
    },

    callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
