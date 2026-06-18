-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local specs = {}
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, file_type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (file_type == 'file' or file_type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    local spec = require('custom.plugins.' .. module)
    if type(spec) == 'table' then
      table.insert(specs, spec)
    end
  end
end
return specs
