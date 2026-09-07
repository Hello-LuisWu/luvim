vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter"
})

local Ts = require('nvim-treesitter')

Ts.install({
    'rust',
    'javascript',
    'zig',
    'html',
    'css',
    'c',
    'lua',
    'luadoc',
    'vim',
    'markdown',
    'markdown_inline',
    'bash',
    'zsh',
    'cpp',
    'rust',
    'vim',
    'vimdoc',
})
