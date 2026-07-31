local loaded = false


local function load_RenderMd()
    if loaded then
        return
    end

    loaded = true

    vim.pack.add({
        gh("MeanderingProgrammer/render-markdown.nvim")
    })
    vim.keymap.set("n", "<leader>md", "<cmd>RenderMarkdown toggle<CR>",
        { desc = "nvim 内部预览 md", noremap = true, silent = true })

    require('render-markdown').setup({
        heading = {
            -- Useful context to have when evaluating values.
            -- | level    | the number of '#' in the heading marker         |
            -- | sections | for each level how deeply nested the heading is |

            -- Turn on / off heading icon & background rendering.
            enabled = true,
            -- Additional modes to render headings.
            render_modes = false,
            -- Turn on / off atx heading rendering.
            atx = true,
            -- Turn on / off setext heading rendering.
            setext = true,
            -- Turn on / off sign column related rendering.
            sign = true,
            -- Replaces '#+' of 'atx_h._marker'.
            -- Output is evaluated depending on the type.
            -- | function | `value(context)`              |
            -- | string[] | `cycle(value, context.level)` |
            icons = { '一、 ', '二、 ', '三、 ', '四、 ', '五、 ', '六、 ' },
            -- Determines how icons fill the available space.
            -- | eol     | '#'s are concealed and icon is placed at right most column   |
            -- | right   | '#'s are concealed and icon is appended to right side        |
            -- | inline  | '#'s are concealed and icon is inlined on left side          |
            -- | overlay | icon is left padded with spaces and overlayed hiding all '#' |
            position = 'overlay',
            -- Added to the sign column if enabled.
            -- Output is evaluated by `cycle(value, context.level)`.
            signs = { '▶ ' },
            -- Width of the heading background.
            -- | block | width of the heading text |
            -- | full  | full width of the window  |
            -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
            width = 'full',
            -- Amount of margin to add to the left of headings.
            -- Margin available space is computed after accounting for padding.
            -- If a float < 1 is provided it is treated as a percentage of available window space.
            -- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
            left_margin = 0,
            -- Amount of padding to add to the left of headings.
            -- Output is evaluated using the same logic as 'left_margin'.
            left_pad = 0,
            -- Amount of padding to add to the right of headings when width is 'block'.
            -- Output is evaluated using the same logic as 'left_margin'.
            right_pad = 0,
            -- Minimum width to use for headings when width is 'block'.
            -- Can also be a list of integers evaluated by `clamp(value, context.level)`.
            min_width = 0,
            -- Determines if a border is added above and below headings.
            -- Can also be a list of booleans evaluated by `clamp(value, context.level)`.
            border = false,
            -- Always use virtual lines for heading borders instead of attempting to use empty lines.
            border_virtual = false,
            -- Highlight the start of the border using the foreground highlight.
            border_prefix = false,
            -- Used above heading for border.
            above = '▄',
            -- Used below heading for border.
            below = '▀',
            -- Highlight for the heading icon and extends through the entire line.
            -- Output is evaluated by `clamp(value, context.level)`.
            backgrounds = {
                'RenderMarkdownH1Bg',
                'RenderMarkdownH2Bg',
                'RenderMarkdownH3Bg',
                'RenderMarkdownH4Bg',
                'RenderMarkdownH5Bg',
                'RenderMarkdownH6Bg',
            },
            -- Highlight for the heading and sign icons.
            -- Output is evaluated using the same logic as 'backgrounds'.
            foregrounds = {
                'RenderMarkdownH1',
                'RenderMarkdownH2',
                'RenderMarkdownH3',
                'RenderMarkdownH4',
                'RenderMarkdownH5',
                'RenderMarkdownH6',
            },
            -- Define custom heading patterns which allow you to override various properties based on
            -- the contents of a heading.
            -- The key is for healthcheck and to allow users to change its values, value type below.
            -- | pattern    | matched against the heading text @see :h lua-patterns |
            -- | icon       | optional override for the icon                        |
            -- | background | optional override for the background                  |
            -- | foreground | optional override for the foreground                  |
            custom = {},
        },

        link = {
            -- Turn on / off inline link icon rendering.
            enabled = true,
            -- Additional modes to render links.
            render_modes = false,
            -- How to handle footnote links, start with a '^'.
            footnote = {
                -- Turn on / off footnote rendering.
                enabled = true,
                -- Inlined with content.
                icon = '󰯔 ',
                -- Custom processing for footnote body to show.
                -- Runs before prefix / suffix are added and superscript processing.
                body = function(ctx)
                    return ctx.text
                end,
                -- Replace value with superscript equivalent.
                superscript = true,
                -- Added before link content.
                prefix = '',
                -- Added after link content.
                suffix = '',
            },
            -- Inlined with 'image' elements.
            image = '󰥶 ',
            -- Check custom for 'image' elements.
            image_custom = true,
            -- Inlined with 'email_autolink' elements.
            email = '󰀓 ',
            -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
            hyperlink = '󰌹 ',
            -- Applies to the inlined icon as a fallback.
            highlight = 'RenderMarkdownLink',
            -- Applies to the link title.
            highlight_title = 'RenderMarkdownLinkTitle',
            -- Applies to WikiLink elements.
            wiki = {
                -- Turn on / off WikiLink rendering.
                enabled = true,
                -- Inlined with content.
                icon = '󱗖 ',
                -- Hide destination if there is an alias.
                conceal_destination = true,
                -- Custom processing for WikiLink body to show.
                body = function()
                    return nil
                end,
                -- Applies to the inlined icon.
                highlight = 'RenderMarkdownWikiLink',
                -- Highlight for item associated with the WikiLink.
                scope_highlight = nil,
            },
            -- Define custom destination patterns so icons can quickly inform you of what a link
            -- contains. Applies to 'image', 'inline_link', 'uri_autolink', and WikiLink nodes.
            -- When multiple patterns match a link the one with the longer pattern is used.
            -- The key is for healthcheck and to allow users to change its values, value type below.
            -- | icon      | gets inlined before the link text                               |
            -- | pattern   | matched against the destination text                            |
            -- | kind      | optional determines how pattern is checked                      |
            -- |           | pattern | @see :h lua-patterns, is the default if not set       |
            -- |           | suffix  | @see :h vim.endswith()                                |
            -- |           | url     | similar to pattern with additional prefix checks      |
            -- | priority  | optional used when multiple match, uses pattern length if empty |
            -- | highlight | optional highlight for 'icon', uses fallback highlight if empty |
            -- stylua: ignore
            custom = {
                web = { icon = '󰖟 ', pattern = '^http' },
                apple = { icon = ' ', pattern = 'apple%.com', kind = 'url' },
                discord = { icon = '󰙯 ', pattern = 'discord%.com', kind = 'url' },
                github = { icon = '󰊤 ', pattern = 'github%.com', kind = 'url' },
                gitlab = { icon = '󰮠 ', pattern = 'gitlab%.com', kind = 'url' },
                google = { icon = '󰊭 ', pattern = 'google%.com', kind = 'url' },
                hackernews = { icon = ' ', pattern = 'ycombinator%.com', kind = 'url' },
                linkedin = { icon = '󰌻 ', pattern = 'linkedin%.com', kind = 'url' },
                microsoft = { icon = ' ', pattern = 'microsoft%.com', kind = 'url' },
                neovim = { icon = ' ', pattern = 'neovim%.io', kind = 'url' },
                reddit = { icon = '󰑍 ', pattern = 'reddit%.com', kind = 'url' },
                slack = { icon = '󰒱 ', pattern = 'slack%.com', kind = 'url' },
                stackoverflow = { icon = '󰓌 ', pattern = 'stackoverflow%.com', kind = 'url' },
                steam = { icon = ' ', pattern = 'steampowered%.com', kind = 'url' },
                twitter = { icon = ' ', pattern = 'twitter%.com', kind = 'url' },
                wikipedia = { icon = '󰖬 ', pattern = 'wikipedia%.org', kind = 'url' },
                x = { icon = ' ', pattern = 'x%.com', kind = 'url' },
                youtube = { icon = '󰗃 ', pattern = 'youtube[^.]*%.com', kind = 'url' },
                youtube_short = { icon = '󰗃 ', pattern = 'youtu%.be', kind = 'url' },
            },
        },
    })
end




vim.api.nvim_create_autocmd("filetype", {
    group = vim.api.nvim_create_augroup("setupRenderMd", { clear = true }),
    pattern = "markdown",
    callback = load_RenderMd,
})
