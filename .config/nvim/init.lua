_G.map = vim.keymap.set

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
_G.gh = function(repo) return 'https://github.com/' .. repo end

---@class Map_Keys
---@field keys string
---@field command string|function
---@field mode? string
---@field desc? string

---@param keys Map_Keys[]
_G.map_keys = function(keys)
    for _, k in pairs(keys) do
        if !k.mode then k.mode = 'n' end
        map(k.mode, k.keys, k.command, { desc = k.desc })
    end
end

require 'options'
require 'keymaps'
require 'pack'
require 'cmds'
require 'treesitter'
require 'lsp'

require 'plugins'
