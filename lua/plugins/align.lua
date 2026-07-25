-- NOTE: p: 符号对齐

vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup("SetupMiniAlign", { clear = true }),
    once = true,
    callback = function()
        vim.pack.add({
            { src = 'https://github.com/nvim-mini/mini.align', version = 'stable' },
        })
        require("mini.align").setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                start = '<leader>a',
                start_with_preview = '<leader>A',
            },

            -- Modifiers changing alignment steps and/or options
            modifiers = {
                -- 【主功能修饰符】
                -- s: 手动输入自定义分割正则，复杂分割场景使用
                ['s'] = nil,
                -- j: 切换对齐方向 left(左对齐)/right(右对齐)/center(居中)
                ['j'] = nil,
                -- m: 自定义合并分隔符，对齐后用该符号拼接文本片段
                ['m'] = nil,

                -- 【预处理修饰符：分割前先处理文本】
                -- f: Lua表达式过滤分割片段，只保留符合条件内容再对齐
                ['f'] = nil,
                -- i: 忽略部分分割匹配点，跳过指定位置不分割
                ['i'] = nil,
                -- p: 片段配对对齐，适合括号、键值成对场景
                ['p'] = nil,
                -- t: 自动修剪每段文本前后多余空格再对齐
                ['t'] = nil,

                -- 退格键：撤销上一步添加的预处理规则
                ['<BS>'] = nil,

                -- 【常用符号一键增强预设】输入符号直接套用成熟对齐规则
                -- = 等号对齐（代码赋值语句）
                ['='] = nil,
                -- , 逗号对齐（函数参数、数组列表）
                [','] = nil,
                -- | 竖线对齐（Markdown 表格）
                ['|'] = nil,
                -- 空格 多空格分列对齐
                [' '] = nil,
            },


            -- 默认对齐选项
            options = {
                -- 默认不指定分隔符
                split_pattern   = "",

                -- 左对齐（最常用）
                justify_side    = "left",

                -- 保持原来的分隔符
                merge_delimiter = "",
            },



            -- 对齐步骤（一般不用动，使用默认即可）
            steps = {
                pre_split   = {},
                split       = nil,
                pre_justify = {},
                justify     = nil,
                pre_merge   = {},
                merge       = nil,
            },


            -- 是否禁用非错误消息（如帮助提示）
            silent = false, -- false 表示显示提示信息，便于学习

        })
    end,
})
