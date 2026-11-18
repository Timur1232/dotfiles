vim.lsp.config('arduino_language_server', {
    cmd = {
        "arduino-language-server",
        "-fqbn", "esp32:esp32:esp32",
    },
    filetypes = { "arduino" },
})
