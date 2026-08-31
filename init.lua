vim.loader.enable()
local loader = require("utils.loader")
loader.load("config")
loader.load("plugins")


--[[
--
-- This file is not required for your own configuration,
-- but helps people determine if their system is setup correctly.
--
--]]

local check_version = function()
  local verstr = tostring(vim.version())
  if not vim.version.ge then
    vim.health.error(string.format("Neovim 版本过旧：'%s'。请升级到最新的稳定版或 nightly 版", verstr))
    return
  end

  if vim.version.ge(vim.version(), '0.12') then
    vim.health.ok(string.format("Neovim 版本为：'%s'", verstr))
  else
    vim.health.error(string.format("Neovim 版本过旧：'%s'。请升级到最新的稳定版或 nightly 版", verstr))
  end
end

local check_external_reqs = function()
  -- Basic utils: `git`, `make`, `unzip`
  for _, exe in ipairs { 'git', 'make', 'unzip', 'rg', 'gcc' } do
    local is_executable = vim.fn.executable(exe) == 1
    if is_executable then
      vim.health.ok(string.format("找到可执行文件：'%s'", exe))
    else
      vim.health.warn(string.format("未找到可执行文件：'%s'", exe))
    end
  end

  return true
end

return {
  check = function()
    vim.health.start 'luvim 健康检查'

    vim.health.info [[注意：在 `:checkhealth` 中并非每个警告都是“必须修复”的。

  仅修复你打算使用的插件和语言的警告。
    Mason 会为未安装的语言给出警告。
    除非你需要使用这些语言，否则无需安装。]]

    local uv = vim.uv or vim.loop
    vim.health.info('系统信息: ' .. vim.inspect(uv.os_uname()))

    check_version()
    check_external_reqs()
  end,
}
