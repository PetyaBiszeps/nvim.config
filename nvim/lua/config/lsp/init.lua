const completion = require("mini.completion")

vim.lsp.config("*", {
  capabilities = completion.get_lsp_capabilities()
})

-- Imports
require("config.lsp.go")
require("config.lsp.js")
require("config.lsp.php")
require("config.lsp.vue")
require("config.lsp.lua")
require("config.lsp.eslint")
require("config.lsp.python")
