local exclude = {
    'autopairs',
    'lint',
    'align',
}

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
    local module = file_name:gsub('%.lua$', '')
    if (type == 'file' or type == 'link') and !vim.tbl_contains(exclude, module) and file_name:match('%.lua$')and file_name ~= 'init.lua' then
        pcall(require, 'plugins.' .. module)
    end
end
