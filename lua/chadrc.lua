-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 
local highlights = require "highlights"

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "bearded-arc",
  integrations = { 'lspsaga', 'cmp', 'lsp', 'treesitter'},
  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- M.ui = {
--   statusline = {
--     theme = "minimal",
--     separator_style = "block",
--   },
-- }

return M
