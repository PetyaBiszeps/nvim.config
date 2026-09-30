local langs = require("langs")

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = langs.servers
})
