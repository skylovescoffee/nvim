-- Setup TS Server
local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup {
      enable_formatting = true,
    }

    ts_utils.setup_client(client)
  end,
}