-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  -- CursorLine = {
  --   bg = "black2",
  -- },
  Comment = {
    italic = true,
  },
  ["@comment"] = { italic = true },
  Keyword = { italic = true },
  Conditional = { italic = true },
  Include = { italic = true },
}

---@type HLTable
M.add = {
 NnnNormal = { fg = "#00a9c8"},
 NnnBorder = { fg = "#f8004e"}
}
--
return M
