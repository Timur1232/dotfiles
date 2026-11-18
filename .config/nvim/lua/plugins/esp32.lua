vim.pack.add({
  "https://github.com/folke/snacks.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/Aietes/esp32.nvim",
})

require("snacks").setup({})
require("esp32").setup()

vim.lsp.config("clangd", require("esp32").lsp_config())
vim.lsp.enable("clangd")
