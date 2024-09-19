local M = {}
M.surround = {
  version = false,
  keys = { "-" },
  "echasnovski/mini.surround",
  opts = {
    -- highlight_duration = 300,
    mappings = {
      add = "-a", -- Add surrounding in Normal and Visual modes
      delete = "-d", -- Delete surroundng
      find = "",
      find_left = "",
      highlight = "",
      replace = "-r", -- Replace surroundng
      update_n_lines = "",
      suffix_last = "",
      suffix_next = "",
    },
    -- n_lines = 10,
    respect_selection_type = true,
    search_method = "cover_or_next",
  },
}
M.clue = {
  "echasnovski/mini.clue",
  version = false,
  event = "VeryLazy",
  config = function()
    local miniclue = require "mini.clue"
    miniclue.setup {
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },
        -- Built-in completion
        { mode = "i", keys = "<C-x>" },
        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        -- Surround
        { mode = "n", keys = "-" },
        { mode = "x", keys = "-" },
        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },
        -- Window commands
        { mode = "n", keys = "<C-w>" },
        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.registers { show_contents = true },
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<Leader>f", desc = "+Finders" },
        { mode = "n", keys = "<Leader>l", desc = "+LSP" },
        { mode = "n", keys = "<Leader>u", desc = "+lazy" },
        { mode = "n", keys = "-a", desc = "+surround" },
        { mode = "n", keys = "-d", desc = "-surround" },
        { mode = "n", keys = "-r", desc = "resurround" },
        { mode = "x", keys = "-a", desc = "+surround" },
        { mode = "x", keys = "-d", desc = "-surround" },
        { mode = "x", keys = "-r", desc = "resurround" },
        { mode = "n", keys = "<Leader>l<Right>", postkeys = "<Leader>l" },
        { mode = "n", keys = "<Leader>l<Left>", postkeys = "<Leader>l" },
        -- { mode = "n", keys = "<Leader>up", postkeys = "<Leader>u" },
        -- { mode = "n", keys = "<Leader>ui", postkeys = "<Leader>u" },
        -- { mode = "n", keys = "<Leader>uu", postkeys = "<Leader>u" },
      },
      window = {
        -- Show window immediately
        delay = 0,
        config = {
          -- Compute window width automatically
          width = "auto",
          border = "rounded",
        },
      },
    }
  end,
}

M.ai = {
  "echasnovski/mini.ai",
  -- keys = {
  --   { "a", mode = { "x", "o" } },
  --   { "i", mode = { "x", "o" } },
  -- },
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup {
      n_lines = 100,
      mappings = {
        goto_left = "g<Left>",
        goto_right = "g<Right>",
      },
    }
  end,
}

-- M.comment = {
--   "echasnovski/mini.comment",
--   keys = { "gc", mode = { "n", "x" } },
--   opts = {},
-- }

M.mini = {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    require("mini.indentscope").setup()
    require("mini.misc").setup()
    require("mini.icons").setup()
  end,
}
M.animate = {
  "echasnovski/mini.animate",
  event = "WinScrolled",
  config = function()
    local animate = require "mini.animate"
    local mouse_scrolled = false
    for _, scroll in ipairs { "Up", "Down" } do
      local key = "<ScrollWheel" .. scroll .. ">"
      vim.keymap.set({ "", "i" }, key, function()
        mouse_scrolled = true
        return key
      end, { expr = true })
    end
    require("mini.animate").setup {
      resize = {
        timing = animate.gen_timing.linear { duration = 100, unit = "total" },
      },
      scroll = {
        timing = animate.gen_timing.quadratic { duration = 160, unit = "total" },
        subscroll = animate.gen_subscroll.equal {
          predicate = function(total_scroll)
            if mouse_scrolled then
              mouse_scrolled = false
              return false
            end
            return total_scroll > 1
          end,
        },
      },
    }
  end,
}

return M
