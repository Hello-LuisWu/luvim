--------------------------------------------------------------------------------
-- 插件快捷键懒加载
--------------------------------------------------------------------------------

local M = {}

-- 插件加载状态
local loaded = {}

--- 注册插件快捷键懒加载
---@param opts table
---  name   : 插件唯一名称
---  src    : 插件地址列表
---  keys   : 快捷键
---  mode   : 模式
---  setup  : 初始化函数
---  action : 执行功能
---  desc   : 快捷键描述
function M.map(opts)

    vim.keymap.set(opts.mode or "n", opts.keys, function()

        ------------------------------------------------------------------------
        -- 1. 检查插件是否已经加载
        ------------------------------------------------------------------------

        if not loaded[opts.name] then

            -- 安装插件
            vim.pack.add(opts.src)

            -- 初始化插件
            if opts.setup then
                opts.setup()
            end

            -- 标记加载完成
            loaded[opts.name] = true
        end

        ------------------------------------------------------------------------
        -- 2. 执行快捷键功能
        ------------------------------------------------------------------------

        if opts.action then
            opts.action()
        end

    end, {
        noremap = true,
        silent = true,
        desc = opts.desc or "插件懒加载",
    })
end

return M
