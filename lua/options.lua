require "nvchad.options"
local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

-- opt.mousescroll = "ver:1,hor:2"
g.toggle_theme_icon = " 󰯙  "
opt.scrolloff = 3
opt.timeoutlen = 0
opt.iskeyword:append("#")
opt.cmdheight = 0

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
autocmd("BufEnter", {
  pattern = "*",
  command = "silent! lcd %:p:h",
})

autocmd("FileType", {
  pattern = { 'help', 'vimdoc', 'lazy', 'nofile' },
  callback = function()
    map("n", "d", "<c-d>", { buffer = 0, silent = true })
    map("n", "f", "<c-f>", { buffer = 0, silent = true })
    map("n", "u", "<c-u>", { buffer = 0, silent = true })
    map("n", "gh", '<c-]>' , { buffer = 0, silent = true, noremap = true })
  end,
})
autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
    end
})
autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    map("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
autocmd("BufWinEnter", {
  pattern = "*md",
  command = "set linebreak breakindent textwidth=0 breakindentopt=shift:2",
})
