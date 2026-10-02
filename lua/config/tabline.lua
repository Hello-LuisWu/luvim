local opt = vim.opt
-- 创建全局函数供 tabline 调用
--[[
_G.my_tabline = function()
    local s = ''
    local tabs = vim.fn.tabpagenr('$')
    local current = vim.fn.tabpagenr()

    for tab = 1, tabs do
        local winnr = vim.fn.tabpagewinnr(tab)
        local buflist = vim.fn.tabpagebuflist(tab)
        local bufnr = buflist[winnr]
        local bufname = vim.fn.bufname(bufnr)

        -- 精简文件名
        bufname = bufname:match("([^/]+)$") or "[No Name]"

        -- 高亮当前标签页
        if tab == current then
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end

        -- 添加标签页序号和文件名
        s = s .. ' ' .. tab .. ':' .. bufname .. ' '

        -- 添加修改标记
        if vim.fn.getbufvar(bufnr, '&modified') == 1 then
            s = s .. '%#WarningMsg#[+] '
        end
    end

    -- 右侧填充空白
    s = s .. '%#TabLineFill#%='

    return s
end

]]

-- 应用配置
-- vim.o.tabline = "%!v:lua.my_tabline()"
opt.showtabline = 2 -- 2 总是显示标签页，0 不显示，1 出现多个标签页才显示
opt.tabpagemax = 9  -- 最多可以打开 9 个标签页，默认10个
