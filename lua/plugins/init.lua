local mini = require "configs.miniconfig"
local overrides = require "configs.overrides"
local map = vim.keymap.set
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css",
  		},
  	},
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "folke/which-key.nvim", enabled = false },
  mini.mini,
  mini.surround,
  mini.ai,
  mini.animate,
  mini.clue,
  overrides.cmp,
  overrides.gits,
  {
    "smoka7/hop.nvim",
    keys = {
      {
        ",",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
      },
    },
    opts = {
      multi_windows = true,
      keys = "onetuhasrcidpgmjbkxqwyf",
      uppercase_labels = true,
      reverse_distribution = false,
    },
  },
  {
    "luukvbaal/nnn.nvim",
    keys = { "<leader>p" },
    cmd = { "NnnPicker" },
    config = function()
      local builtin = require("nnn").builtin
      local opts = {
        mappings = {
          { "<C-v>", builtin.open_in_vsplit },
        },
        windownav = {
          -- window movement mappings to navigate out of nnn
          left = nil,
          right = nil,
          next = nil,
          prev = nil,
        },
        picker = {
          style = {
            width = 0.8, -- percentage relative to terminal size when < 1, absolute otherwise
            height = 0.75, -- ^
            -- xoffset = 0.5,   -- ^
            -- yoffset = 0.5,   -- ^
            border = "rounded", -- border decoration for example "rounded"(:h nvim_open_win)
          },
        },
      }
      require("nnn").setup(opts)
    end,
  },
  { "tpope/vim-repeat", event = "VeryLazy" },

  {
    url = "https://github.com/ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      "fzf",
      -- "telescope",
      winopts = {
        split = "belowright vnew",
        preview = {
          default = "builtin",
          flip_columns = 96,
          -- border = "none",
          layout = "vertical",
        },
        winopts = { -- builtin previewer window options
          number = false,
        },
      },
      oldfiles = {
        include_current_session = true,
        path_shorten = 3,
      },
    },
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    config = true, -- default settings
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "VeryLazy",
    opts = {
      line_num = { style = "#8074ff" },
      blank = { enable = false },
      indent = { enable = false },
      chunk = {
        enable = true,
      },
    },
  },
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim", opts = { context = 16 } },
    cmd = "ZenMode",
    -- ft = { "help", "vimdoc" },
    opts = overrides.zen,
  },

  {
    "nvim-focus/focus.nvim",
    keys = {
      { "<C-Right>" },
      { "<C-Left>" },
      { "<C-Up>" },
      { "<C-Down>" },
    },
    config = function()
      require("focus").setup { excluded_filetypes = { "terminal" } }
      map({ "n", "t" }, "<C-Right>", "<cmd>FocusSplitRight<cr>")
      map({ "n", "t" }, "<C-Left>", "<cmd>FocusSplitLeft<cr>")
      map({ "n", "t" }, "<C-Up>", "<cmd>FocusSplitUp<cr>")
      map({ "n", "t" }, "<C-Down>", "<cmd>FocusSplitDown<cr>")
    end,
  },
  -- { "jpalardy/vim-slime", cmd = "SlimeConfig" },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    opts = {
      columns = { "icon" },
      skip_confirm_for_simple_edits = true,
      -- skip_confirm_for_simple_edits = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["q"] = "actions.close",
        -- ["<C-r>"] = "actions.refresh",
        ["<"] = "actions.parent",
        ["<Left>"] = "actions.parent",
        -- ["g."] = "actions.toggle_hidden",
        ["P"] = "actions.preview",
      },
      use_default_keymaps = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
      },
    },
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
    },
  },

  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {},
  },

  {
    "folke/flash.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    opts = {
      labels = "onetuhasidcrpgbkmjxfywql",
      modes = {
        char = { keys = { [";"] = "L", [","] = "H" }, jump_labels = true },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
    },
    config = function()
      require("flash").setup()
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#323d51", fg = "#ff7ac4" })
      vim.api.nvim_set_hl(0, "FlashCurrent", { bg = "#323d51", fg = "#00ea8b" })
      vim.api.nvim_set_hl(0, "FlashMatch", { bg = "#323d51", fg = "#b995ff" })
    end,
  },

  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
  {
    "ptdewey/yankbank-nvim",
    keys = { "<leader>y" },
    config = function()
      require("yankbank").setup()
      map("n", "<leader>y", "<cmd>YankBank<CR>", { noremap = true })
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    opts = { user_default_options = { names = false } },
    config = function(_, opts)
      require("colorizer").setup(opts)

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
		event = 'LspAttach',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
  },
}
