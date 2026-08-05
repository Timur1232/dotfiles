vim.pack.add { gh 'nvim-treesitter/nvim-treesitter', gh 'nvim-mini/mini.nvim' }
vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
    bullet = {
        enabled = true,
        render_modes = false,
        icons = { '-', '>', '>', '>' },
        ordered_icons = function(ctx)
            local value = vim.trim(ctx.value)
            local index = tonumber(value:sub(1, #value - 1))
            return ('%d.'):format(index > 1 and index or ctx.index)
        end,
        left_pad = 0,
        right_pad = 0,
        highlight = 'RenderMarkdownBullet',
        scope_highlight = {},
        scope_priority = nil,
    },
}
