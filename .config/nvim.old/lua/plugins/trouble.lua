vim.pack.add { gh 'folke/trouble.nvim' }

map_keys({
    {
        keys = '<leader>xx',
        command = '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
    },
    {
        keys = '<leader>xX',
        command = '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
    },
    {
        keys = '<leader>cs',
        command = '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
    },
    {
        keys = '<leader>cl',
        command = '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
        keys = '<leader>xL',
        command = '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
    },
    {
        keys = '<leader>xQ',
        command = '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
    },
})
