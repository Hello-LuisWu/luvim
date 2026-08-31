vim.pack.add({
    {
        src = "https://github.com/echasnovski/mini.indentscope",
        version = "stable"
    },
    "https://github.com/lukas-reineke/indent-blankline.nvim"
})

local loader = false


local function load_indentscope()
    if loaded then
        return
    end

    loaded = true


    local highlight = {
        "RainbowRed",
        -- "RainbowYellow",
        -- "RainbowBlue",
        -- "RainbowOrange",
        -- "RainbowGreen",
        -- "RainbowViolet",
        -- "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#444444" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    require("ibl").setup({
        indent = {
            char = "▏",
            -- char = "┊",
            highlight = highlight,
        },

    })

    require('mini.indentscope').setup({
        -- Draw options
        draw = {
            -- Delay (in ms) between event and start of drawing scope indicator
            delay = 100,

            -- Animation rule for scope's first drawing. A function which, given
            -- next and total step numbers, returns wait time (in ms). See
            -- |MiniIndentscope.gen_animation| for builtin options. To disable
            -- animation, use `require('mini.indentscope').gen_animation.none()`.
            -- 动画效果函数（n当前步数，total总步数）
            -- 这里使用线性渐隐动画（返回值是每帧间隔时间）
            animation = function(n, total)
                return math.floor(20 * (1 - n / total)) -- 线性渐隐
            end,

            -- Whether to auto draw scope: return `true` to draw, `false` otherwise.
            -- Default draws only fully computed scope (see `options.n_lines`).
            predicate = function(scope) return not scope.body.is_incomplete end,

            -- Symbol priority. Increase to display on top of more symbols.
            priority = 2,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Textobjects
            object_scope = 'ii',
            object_scope_with_border = 'ai',

            -- Motions (jump to respective border line; if not present - body line)
            goto_top = '[i',
            goto_bottom = ']i',
        },

        -- Options which control scope computation
        options = {
            -- Type of scope's border: which line(s) with smaller indent to
            -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
            border = 'both',

            -- Whether to use cursor column when computing reference indent.
            -- Useful to see incremental scopes with horizontal cursor movements.
            indent_at_cursor = true,

            -- Maximum number of lines above or below within which scope is computed
            n_lines = 10000,

            -- Whether to first check input line to be a border of adjacent scope.
            -- Use it if you want to place cursor on function header to get scope of
            -- its body.
            try_as_border = false,
        },

        -- Which character to use for drawing scope indicator
        -- symbol = '╎',
        symbol = '▎',
        -- symbol = '▏',



    }) -- replace {} with your config table
end

vim.api.nvim_create_autocmd({ "insertenter" }, {
    group = vim.api.nvim_create_augroup("setupIndentscope", { clear = true }),
    once = true,
    callback = load_indentscope

})
