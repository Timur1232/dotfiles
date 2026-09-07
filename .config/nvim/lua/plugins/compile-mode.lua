vim.pack.add {
    { src = gh "ej-shafran/compile-mode.nvim", version = "5.15.0" },
    gh "nvim-lua/plenary.nvim",
    { src = gh "m00qek/baleia.nvim", tag = "v1.3.0" },
}

vim.g.compile_mode = {
    default_command = "",
    baleia_setup = true,
    error_regexp_table = {
        odin = {
            regex = "^\\(.\\{-}\\)(\\([0-9]\\+\\):\\([0-9]\\+\\)) \\(.\\{-}\\):",
            filename = 1,
            row = 2,
            col = 3,
            type = { 4 },
        },
    },
    input_word_completion = true,
}

require("baleia").setup {}
require("compile-mode").setup {}
