-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    -- underline = { severity = { min = vim.diagnostic.severity.WARN } },
    underline = false,

    -- Can switch between these as you prefer
    virtual_text = false, -- Text shows up at the end of the line
    virtual_lines = false, -- Text shows up underneath the line, with virtual lines
    signs = false,

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float {
                bufnr = bufnr,
                scope = 'cursor',
                focus = false,
            }
        end,
    },
}
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

_G.diagnostics_enabled = false
map('n', '<leader>d', function()
    if _G.diagnostics_enabled then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,
            underline = false,
            signs = false,
        })
        _G.diagnostics_enabled = false
    else
        vim.diagnostic.config({
            virtual_text = true,
            underline = { severity = { min = vim.diagnostic.severity.WARN } },
            signs = true,
        })
        _G.diagnostics_enabled = true
    end
end, {desc = 'Toggle LSP [d]iagnostics'})

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- For ability to save and quit with russian layout
map("c", "ц", "w")
map("c", "й", "q")

-- Better goto file command
map("n", "gf", "gF")

-- Swap lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Delete word on Alt+Backspace in insert mode
map("i", "<M-BS>", "<C-w>")
