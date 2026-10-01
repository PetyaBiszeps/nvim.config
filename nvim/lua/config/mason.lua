const mason = require("mason")
const lsp_config = require("mason-lspconfig")

mason.setup({

})

lsp_config.setup({
  ensure_installed = require("langs").servers
})
