local keymap = vim.keymap
local M = {}
-- M.treesitter = {
--   ensure_installed = {
--     "vim",
--     "lua",
--     "html",
--     "css",
--     "javascript",
--     "c",
--     "julia",
--     "latex",
--     "vimdoc",
--     "markdown",
--     "markdown_inline",
--     "query",
--     "python",
--     "r",
--     "bash",
--     "toml",
--     "yaml",
--     "scss",
--     "regex",
--     "json",
--     "json5",
--     "jsonc",
--     -- "org",
--   },
--   matchup = { enable = true },
-- }
--
-- M.mlsp = {
--   {
--     "folke/neodev.nvim",
--     -- opts = {
--     --   library = {
--     --     enabled = false,
--     --   },
--     --   setup_jsonls = false,
--     -- }
--   }, -- optional
--
--   {
--     "williamboman/mason-lspconfig.nvim",
--     event = "VeryLazy",
--     dependencies = {
--       "williamboman/mason.nvim",
--     },
--     config = function()
--       require("neodev").setup {}
--       require("mason-lspconfig").setup {
--         ensure_installed = {
--           -- others
--           "bashls",
--           "pyright",
--           -- "pylyzer",
--           "cssls",
--           "html",
--           "r_language_server",
--           "emmet_ls",
--           -- "ruff_lsp",
--           "sourcery",
--           "jsonls",
--           -- "lua_ls",
--         },
--         -- automatic_installation = true,
--       }
--       local config = require "nvchad.configs.lspconfig"
--       local on_attach = config.on_attach
--       local capabilities = config.capabilities
--       --     require("neodev").setup {} -- optional
--       --
--       -- most frameworks have a capabilities table and on_attach function you can import
--
--       -- if you just want default config for the servers then put them in a table
--       local servers = {
--         "lua_ls",
--         "pyright",
--         -- "pylyzer",
--         "cssls",
--         "html",
--         "r_language_server",
--         -- "ruff_lsp",
--         "jsonls",
--         "sourcery",
--       }
--       lsp = require "lspconfig"
--       for k = 1, #servers do
--         lsp[servers[k]].setup {
--           on_attach = on_attach,
--           capabilities = capabilities,
--         }
--       end
--
--       -- or here for extra options
--
--       lsp["bashls"].setup {
--         on_attach = on_attach,
--         capabilities = capabilities,
--         filetypes = { "sh", "shrc" },
--       }
--       lsp["emmet_ls"].setup {
--         on_attach = on_attach,
--         capabilities = capabilities,
--         filetypes = {
--           "css",
--           "html",
--           "less",
--           "sass",
--           "scss",
--           "md",
--         },
--       }
--
--       lsp["pyright"].setup {
--         on_attach = function(client, bufnr)
--           on_attach(client, bufnr)
--           lsp.pyright.commands.PyrightSetPythonPath "/Users/tariq/mambaforge/envs/tq/bin/python" -- the python binary for a conda env, for example
--         end,
--         capabilities = capabilities,
--         settings = {
--           pyright = {
--             disableOrganizeImports = true,
--           },
--           python = {
--             analysis = {
--               autoImportCompletions = true,
--               autoSearchPaths = false,
--               diagnosticMode = "openFilesOnly",
--             },
--           },
--         },
--       }
--     end,
--   },
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       -- make sure mason installs the server
--       servers = {
--         jsonls = {
--           -- lazy-load schemastore when needed
--           on_new_config = function(new_config)
--             new_config.settings.json.schemas = new_config.settings.json.schemas or {}
--             vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
--           end,
--           settings = {
--             json = {
--               format = {
--                 enable = true,
--               },
--               validate = { enable = true },
--             },
--           },
--         },
--       },
--     },
--   },
--   -- {
--   -- 	"neovim/nvim-lspconfig",
--   -- 	init = nil,
--   -- },
--
--   { "soulis-1256/hoverhints.nvim", event = "LspAttach" },
--   {
--     "glepnir/lspsaga.nvim",
--     event = "LspAttach",
--     config = function()
--       require("lspsaga").setup {
--         ui = {
--           title = false,
--           border = "rounded",
--           scroll_down = "<C-d>",
--           scroll_up = "<C-u>",
--           -- winblend=.5,
--           -- code_action = '󱐌',
--         },
--       }
--       keymap.set({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>", { desc = "code action" })
--       keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { desc = "rename" })
--       keymap.set("n", "<leader>lgd", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek definition" })
--       keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "show line diagnostics" })
--       keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "show buffer diagnostics" })
--       keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "outline" })
--       keymap.set("n", "<leader>l<Right>", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "next" })
--       keymap.set("n", "<leader>l<Left>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "prev" })
--       -- keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep ++quiet<CR>", { desc = "hover" })
--     end,
--     dependencies = {
--       { "nvim-tree/nvim-web-devicons" },
--       { "nvim-treesitter/nvim-treesitter" },
--     },
--   },
--   {
--     "hinell/lsp-timeout.nvim",
--     event = "LspAttach",
--     dependencies = { "neovim/nvim-lspconfig" },
--   },
-- }

M.cmp = {
  {
    "hrsh7th/cmp-path",
    enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    dependencies = {
      {
        {
          "zbirenbaum/copilot-cmp",
          dependencies = "copilot.lua",
          opts = {},
          config = function(_, opts)
            local copilot_cmp = require "copilot_cmp"
            copilot_cmp.setup(opts)
            require("util").on_attach(function(client)
              if client.name == "copilot" then
                copilot_cmp._on_insert_enter {}
              end
            end)
          end,
        },
        { "nat-418/cmp-color-names.nvim" },
      },
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping["<Tab>"] = nil
      opts.mapping["<C-space>"] = nil
      opts.mapping["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
      opts.mapping["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
      opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
      opts.sources = {
        { name = "copilot" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "color_names" },
        {
          name = "buffer",
          option = { indexing_interval = 1000, max_indexed_line_length = 2048 },
        },
      }
      opts.performance = { debounce = 50, throttle = 20, fetching_timeout = 500 }
      -- opts.matching = {
      -- 	disallow_fullfuzzy_matching = false,
      -- 	disallow_partial_fuzzy_matching = false,
      -- 	disallow_partial_matching = false,
      -- 	disallow_fuzzy_matching = false,
      -- 	disallow_prefix_unmatching = false,
      -- }

      opts.sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
      return opts
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
      },
    },
  },
  { "Exafunction/codeium.vim", event = "InsertEnter", dependencies = "hrsh7th/nvim-cmp", build = ":Codeium Auth" },
}

-- M.wilder = function()
--   local wilder = require "wilder"
--   wilder.setup {
--     modes = { ":", "/" },
--   }
--   -- Disable Python remote plugin
--   wilder.set_option("use_python_remote_plugin", 0)
--   wilder.set_option("pipeline", {
--     wilder.branch(
--       wilder.cmdline_pipeline {
--         fuzzy = 1,
--         fuzzy_filter = wilder.lua_fzy_filter(),
--       },
--       wilder.vim_search_pipeline()
--     ),
--   })
--   wilder.set_option(
--     "renderer",
--     wilder.renderer_mux {
--       [":"] = wilder.popupmenu_renderer {
--         highlights = {
--           accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
--         },
--         highlighter = wilder.lua_fzy_highlighter(),
--         left = {
--           " ",
--           wilder.popupmenu_devicons(),
--         },
--         right = {
--           " ",
--           wilder.popupmenu_scrollbar(),
--         },
--       },
--       ["/"] = wilder.wildmenu_renderer {
--         highlights = {
--           accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
--         },
--         highlighter = wilder.lua_fzy_highlighter(),
--       },
--     }
--   )
-- end

-- M.ui = {
--   {
--     "folke/noice.nvim",
--     event = "VeryLazy",
--     dependencies = "MunifTanjim/nui.nvim",
--     opts = {
--       -- presets = {
--       --   command_palette = true,
--       -- },
--       cmdline = {
--         opts = {}, -- global options for the cmdline. See section on views
--         ---@type table<string, CmdlineFormat>
--         format = {
--           -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
--           -- view: (default is cmdline view)
--           -- opts: any options passed to the view
--           -- icon_hl_group: optional hl_group for the icon
--           -- title: set to anything or empty string to hide
--           cmdline = { pattern = "^:", icon = "󰣙", lang = "vim" },
--           search_down = false,
--           search_up = false,
--           filter = false,
--           lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
--           help = false,
--           input = {}, -- Used by input()
--           -- lua = false, -- to disable a format, set to `false`
--         },
--       },
--       lsp = {
--         hover = {
--           enabled = true,
--         },
--         signature = {
--           enabled = true,
--         },
--         message = {
--           enabled = true,
--         },
--       },
--       views = {
--         cmdline_popup = {
--           border = {
--             style = "none",
--             padding = { 2, 3 },
--           },
--           position = {
--             row = 5,
--             col = "50%",
--           },
--           size = {
--             width = 60,
--             height = "auto",
--           },
--           filter_options = {},
--           win_options = {
--             winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
--           },
--         },
--         popupmenu = {
--           relative = "editor",
--           position = {
--             row = 8,
--             col = "50%",
--           },
--           size = {
--             width = 60,
--             height = 10,
--           },
--           border = {
--             style = "rounded",
--             padding = { 0, 1 },
--           },
--           win_options = {
--             winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
--           },
--         },
--         mini = { timeout = 4000 },
--       },
--     },
--     -- stylua: ignore
--     keys = {
--       {
--         "<leader>snl",
--         function() require("noice").cmd("last") end,
--         desc =
--         "Noice Last Message"
--       },
--       {
--         "<leader>snh",
--         function() require("noice").cmd("history") end,
--         desc =
--         "Noice History"
--       },
--       { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
--     },
--   },
--   {
--     "stevearc/dressing.nvim",
--     event = "VeryLazy",
--     opts = {
--       input = {
--         default_prompt = "❯ ",
--       },
--       select = {
--         backend = { "fzf_lua", "telescope" },
--         fzf_lua = {
--           fzf_opts = {
--             ["--info"] = "hidden",
--           },
--           file_icon_padding = " ",
--           winopts = {
--             split = "belowright vnew",
--           },
--         },
--       },
--     },
--   },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   config = function()
  --     require("colorizer").setup {
  --       user_default_options = {
  --         names = false,
  --         RRGGBBAA = true, -- #RRGGBBAA hex codes
  --         -- Available modes for `mode`: foreground, background,  virtualtext
  --         mode = "foreground", -- Set the display mode.
  --         -- virtualtext = "█ ⬚ 󰆖 ",
  --       },
  --     }
  --
  --     -- execute colorizer as soon as possible
  --     vim.defer_fn(function()
  --       require("colorizer").attach_to_buffer(0)
  --     end, 0)
  --   end,
  -- },
-- }

M.zen = {
  window = {
    backdrop = 0.85, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    width = 0.8, -- width of the Zen window
    height = 0.96, -- height of the Zen window
    options = {
      -- signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    -- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
  },
  -- callback where you can add custom code when the Zen window opens
  -- on_open = function(win)
  -- end,
  -- callback where you can add custom code when the Zen window closes
  -- on_close = function()
  -- end,
}

M.gits = {
 "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function() return {} end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
    end,
}

return M
