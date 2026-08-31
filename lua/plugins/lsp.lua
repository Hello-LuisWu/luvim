vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim"
})

local ms = require("mason")
require("lspconfig")

ms.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

 vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
}

vim.lsp.enable({
    'pyright',
    'lua_ls',
    'clangd',
    'bashls'
})

-- 诊断信息的图标
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
        },
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local map = vim.keymap.set

        map('n', 'gk', '<cmd>lua vim.lsp.buf.hover()<cr>',
            { desc = "悬停信息", buffer = event.buf })

        map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
            { desc = "跳转定义", buffer = event.buf })

        map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
            { desc = "跳转到声明", buffer = event.buf })

        map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
            { desc = "跳转到实现", buffer = event.buf })

        map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
            { desc = "跳转到类型定义", buffer = event.buf })

        map('n', 'gy', '<cmd>lua vim.lsp.buf.references()<cr>',
            { desc = "查看引用", buffer = event.buf })

        map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
            { desc = "显示函数签名帮助", buffer = event.buf })

        map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>',
            { desc = "重命名符号", buffer = event.buf })

        map({ 'n', 'x' }, 'gf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
            { desc = "代码格式化", buffer = event.buf })

        map('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>',
            { desc = "代码操作", buffer = event.buf })

        map('n', 'gwa', vim.lsp.buf.add_workspace_folder,
            { desc = "添加工作空间", buffer = event.buf })

        map('n', 'gwr', vim.lsp.buf.remove_workspace_folder,
            { desc = "移除工作空间", buffer = event.buf })

        map('n', 'gwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            { desc = "列出工作空间", buffer = event.buf })
    end,
})

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                    vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                },
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = vim.api.nvim_get_runtime_file('', true),
            },
        })
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },

            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },

            telemetry = {
                enable = false,
            },
        },
    },
})
