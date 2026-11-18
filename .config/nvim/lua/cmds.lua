-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set expandtab to false on Go files',
  pattern = '*.go',
  group = vim.api.nvim_create_augroup('go-tabs', { clear = true }),
  callback = function()
    vim.o.expandtab = false
  end,
})

local function get_current_file_location ()
  return vim.fn.expand("%:p") .. ":" .. vim.fn.line(".") .. ":" .. vim.fn.col(".")
end

vim.api.nvim_create_user_command("Loc",
  function (opts)
    local loc = get_current_file_location()
    if opts.args and opts.args == "copy" then
      vim.fn.setreg("+", loc)
      print("Location copied to clipboard")
    else
      print(loc)
    end
  end,
  {
    nargs = "*",
    complete = function()
      return { "copy" }
    end
  }
)

vim.cmd(":command! -nargs=+ Grep execute 'silent grep! <args>' | copen")

vim.api.nvim_create_user_command('Comp', function(opts)
    if opts.args and opts.args ~= '' then
        vim.o.makeprg = opts.args
    end
    local cmd = vim.fn.shellescape(vim.o.makeprg)
    vim.cmd('! ' .. cmd .. ' 2>&1 | sed "s/\\\\x1b\\\\[[0-9;]*[a-zA-Z]//g"') -- ansi filter
end, { nargs = '*' })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})
