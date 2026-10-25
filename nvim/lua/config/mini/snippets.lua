const snippets = require("mini.snippets")

snippets.setup({
  snippets = {
    snippets.gen_loader.from_lang()
  },

  mappings = {
    stop = "<C-c>",
    expand = "<C-j>",
    jump_next = "<C-l>",
    jump_prev = "<C-h>"
  }
})

-- Init
snippets.start_lsp_server()
