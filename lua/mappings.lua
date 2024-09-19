require "nvchad.mappings"

local map = vim.keymap.set
local kdel = vim.keymap.del

-- kdel("i", "<C-b>")
-- map("i", "<C-a>", "<ESC>^i", { desc = "Move Beginning of line" })
-- map("i", "<C-e>", "<End>", { desc = "Move End of line" })
--
-- kdel("i", "<C-h>")
-- kdel("i", "<C-l>")
-- kdel("i", "<C-j>")
-- kdel("i", "<C-k>")

-- map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- kdel("n", "<C-h>")
-- kdel("n", "<C-l>")
-- kdel("n", "<C-j>")
-- kdel("n", "<C-k>")

-- kdel("n", "<Leader>wa")
-- kdel("n", "<Leader>wr")
-- kdel("n", "<Leader>wl")
-- kdel("n", "<Leader>wk")
-- kdel("n", "<Leader>wK")
kdel("n", "<Leader>h")

map("n", "<Leader>w", "<cmd>w<CR>", { desc = "write", nowait = true })
map("n", "<Leader>q", "<cmd>q!<CR>", { desc = "quit", nowait = true })
-- map("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
kdel("n", "<C-c>")
kdel("n", "<leader>n")
kdel("n", "<leader>rn")
kdel("n", "<leader>ch")

map("i", "<Tab>", function()
  return vim.fn["codeium#Accept"]()
end, { desc = "codium", expr = true })
-- ["<leader>t"] = { "<cmd>SlimeConfig<cr>", "slimeconfig" },
map("n", "<leader>z", function()
  require("zen-mode").toggle()
end, { desc = "zenmode" })

map("n", "<leader>o", "<cmd>Oil --float<cr>", { desc = "oil" })
map("n", "<leader>p", "<cmd>NnnPicker %:p:h<CR>", { desc = "nnn", nowait = true })
map("n", ";", ":", { desc = "command", nowait = true })
map("n", "<leader>lf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "format" })


map("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page", noremap = true, nowait = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page", noremap = true, nowait = true })

map("n", "<leader>uu", ":Lazy<cr>", { desc = "lazy" })
map("n", "<leader>ui", ":Lazy sync<cr>", { desc = "sync" })
map("n", "<leader>up", ":Lazy profile<cr>", { desc = "profile" })
map("n", "<leader>ux", ":cq<cr>", { desc = "restart" })

map("n", "<leader>fn", "<cmd> Nerdy<CR>", { desc = "nerdfonts" })
map("n", "<leader>fg", "<cmd> FzfLua live_grep <CR>", { desc = "grep" })
map("n", "<leader>fr", "<cmd> FzfLua registers <CR>", { desc = "Registers" })
map("n", "<leader>ff", "<cmd> FzfLua files <CR>", { desc = "Files" })
map("n", "<leader>fo", "<cmd> Telescope vim_options <CR>", { desc = "Options" })
map("n", "<leader>fh", "<cmd> FzfLua help_tags <CR>", { desc = "Help" })
map("n", "<leader>r", "<cmd> FzfLua oldfiles <CR>", { desc = "oldfiles", nowait = true })
-- map(
--   "n",
--   "<leader>fi",
--   "<cmd>IconPickerYank alt_font html_colors nerd_font_v3 symbols nerd_font<CR>",
--   { desc = "glyphs" }
-- )

map("i", "<C-t>", function()
  require("fzf-lua").complete_path()
end, { desc = "complete path", nowait = true, silent = true })
-- more keybinds!
-- kdel("n", "<leader>ra")
-- kdel("n", "<leader>rh")

map("n", "<leader>lc", "<cmd> Lspsaga code_action <CR>", { desc = "code action" })
map("n", "<leader>ld", "<cmd> Lspsaga show_line_diagnostics <CR>", { desc = "line diagnostics" })
map("n", "<leader>lb", "<cmd> Lspsaga show_buf_diagnostics <CR>", { desc = "buf diagnostics" })

