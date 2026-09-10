vim.pack.add({
    -- "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/navarasu/onedark.nvim",
    {
        src = "https://github.com/rose-pine/neovim",
        name = "rose-pine",
    },
})
require("rose-pine").setup()
vim.cmd.colorscheme('rose-pine')
-- vim.cmd.colorscheme('onedark')
