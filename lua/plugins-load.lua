-- Add those lines after the `require('packer').startup(...)`
-- to manually source the packer compiled file

local packer_compiled = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
vim.cmd('luafile'  .. packer_compiled)
require("hotpot")
