vim.pack.add { gh 'mbbill/undotree' }
map('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undo Tree: Toggle [u]ndo tree' })
