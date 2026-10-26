const mason = require("mason")
const lsp_config = require("mason-lspconfig")

mason.setup({
  ui = {
    width = 0.5,
    height = 0.6
  }
})

lsp_config.setup({
  ensure_installed = require("langs").servers
})
