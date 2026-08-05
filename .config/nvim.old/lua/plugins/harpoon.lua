vim.pack.add { gh 'nvim-lua/plenary.nvim' }
vim.pack.add { { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' } }

local harpoon = require('harpoon')

-- REQUIRED
harpoon:setup()
-- REQUIRED

local maph = function(mode, keys, func, desc)
    return map(mode, keys, func, { desc = 'Harpoon: ' .. desc })
end

map('n', '<leader>ha', function()
    harpoon:list():add()
end, { desc = '[H]arpoon: [A]ttach current file' })
map('n', '<leader>hm', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[H]arpoon: Toggle quick [m]enu' })

maph('n', '<A-h>', function()
    harpoon:list():select(1)
end, 'Select first file')
maph('n', '<A-j>', function()
    harpoon:list():select(2)
end, 'Select second file')
maph('n', '<A-k>', function()
    harpoon:list():select(3)
end, 'Select third file')
maph('n', '<A-l>', function()
    harpoon:list():select(4)
end, 'Select fourth file')

-- Toggle previous & next buffers stored within Harpoon list
maph('n', '<C-A-p>', function()
    harpoon:list():prev()
end, '[P]revious attached file')
maph('n', '<C-A-n>', function()
    harpoon:list():next()
end, '[N]ext attached file')
