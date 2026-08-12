vim.pack.add { { src = gh 'Vonr/align.nvim', version = 'v2' } }

local align = require('align')
local NS = { noremap = true, silent = true }

-- Aligns to 1 character
map('x', 'aa', function()
    align.align_to_char({
        length = 1,
    })
end, NS)

-- Aligns to 2 characters with previews
map('x', 'ad', function()
    align.align_to_char({
        preview = true,
        length = 2,
    })
end, NS)

-- Aligns to a string with previews
map('x', 'aw', function()
    align.align_to_string({
        preview = true,
        regex = false,
    })
end, NS)

-- Aligns to a Vim regex with previews
map('x', 'ar', function()
    align.align_to_string({
        preview = true,
        regex = true,
    })
end, NS)
