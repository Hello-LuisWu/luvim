-- 查看所在目录
vim.api.nvim_create_user_command("Pwd", function()
    print(vim.fn.getcwd())
end, {
    desc = "Show current working directory",
})

-- 查看 Lsp 信息
vim.api.nvim_create_user_command("LspInfo", function()
    vim.cmd("checkhealth vim.lsp")
end, {
    desc = "Show LSP information",
})
vim.api.nvim_create_user_command('LspLog', function()
  vim.cmd(string.format('tabnew %s', vim.lsp.log.get_filename()))
end, {
  desc = 'Opens the Nvim LSP client log.',
})

-- PackUpdate 命令
vim.api.nvim_create_user_command('PackUpdate', function(opts)
  if opts.args == '' then
    vim.pack.update()
  else
    vim.pack.update(opts.fargs)
  end
end, {
  nargs = '*',
  desc = 'Update packages',
  complete = complete_plugin_names,
})

-- PackDel 命令
vim.api.nvim_create_user_command('PackDel', function(opts)
  if opts.args == '' then
    vim.pack.del({})
  else
    vim.pack.del(opts.fargs)
  end
end, {
  nargs = '*',
  desc = 'Delete packages',
  complete = complete_plugin_names,
})

-- PackGet 命令
vim.api.nvim_create_user_command('PackGet', function(opts)
  if opts.args == '' then
    local info = vim.pack.get()
    print(vim.inspect(info))
  else
    local info = vim.pack.get(opts.fargs)
    print(vim.inspect(info))
  end
end, {
  nargs = '*',
  desc = 'Get packages information',
  complete = complete_plugin_names,
})

-- 重新加载配置
vim.api.nvim_create_user_command("Reload", function()
    dofile(vim.env.MYVIMRC)
    vim.notify("Neovim config reloaded")
end, {
    desc = "Reload Neovim config",
})

-- 直接打开配置
vim.api.nvim_create_user_command("EditConfig", function()
    vim.cmd.edit(vim.env.MYVIMRC)
end, {
    desc = "Edit Neovim config",
})

-- 打开配置目录
vim.api.nvim_create_user_command("Config", function()
    vim.cmd("edit " .. vim.fn.stdpath("config"))
end, {
    desc = "Open Neovim config directory",
})

-- 文本排序
vim.api.nvim_create_user_command("Sort", "'<,'>sort", {
    range = true,
    desc = "Sort selected lines",
})


