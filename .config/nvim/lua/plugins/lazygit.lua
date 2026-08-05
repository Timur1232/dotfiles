vim.pack.add { gh 'nvim-lua/plenary.nvim' }
vim.pack.add { gh 'kdheepak/lazygit.nvim' }

map('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'Lazy Git' })
