local M = {}

---加载指定目录下的所有 lua 模块
---@param dir string 相对于 lua/ 的目录，例如 "plugins"
function M.load(dir)
    local root = vim.fn.stdpath("config") .. "/lua/" .. dir
    local files = vim.fn.globpath(root, "*.lua", false, true)

    table.sort(files)

    for _, file in ipairs(files) do
        local module = vim.fn.fnamemodify(file, ":t:r")

        -- 跳过 init.lua
        if module ~= "init" then
            local ok, err = pcall(require, dir .. "." .. module)

            if not ok then
                vim.notify(
                    string.format(
                        "[Loader] Failed loading %s.%s\n%s",
                        dir,
                        module,
                        err
                    ),
                    vim.log.levels.ERROR
                )
            end
        end
    end
end

return M
