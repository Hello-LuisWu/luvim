_G.gh = function(repo)
    return "https://github.com/" .. repo
end
vim.opt.packpath:append("")
vim.pack.add({
    gh("rafamadriz/friendly-snippets"),
    gh("ellisonleao/gruvbox.nvim"),
    gh("nvim-lua/plenary.nvim"),
    gh("MunifTanjim/nui.nvim"),
    gh("nvim-tree/nvim-web-devicons"),
})
