-- load defaults i.e lua_lsp
local tlsp = require "configs.attach"
tlsp.defaults()

local lspconfig = require "lspconfig"

local servers = {
  html = {},
  cssls = {},
  bashls = {},
  jsonls = {},
  ruff = {},
  basedpyright = {},
  sourcery = {
    init_options = {
        token = require "tokens".sourcery,
        extension_version = 'vim.lsp',
        editor_version = 'vim',
    },
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = tlsp.on_attach,
    on_init = tlsp.on_init,
    capabilities = tlsp.capabilities,
  }
end
