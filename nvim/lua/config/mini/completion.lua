local completion = require("mini.completion")

completion.setup({
  delay = {
    completion = 120,
    info = 300,
    signature = 100
  },

  window = {
    info = {
      border = "rounded",
      height = 15,
      width = 70
    },

    signature = {
      border = "rounded",
      height = 8,
      width = 70
    }
  },

  lsp_completion = {
    process_items = function(items, base)
      return completion.default_process_items(items, base, {
        filtersort = "fuzzy"
      })
    end
  }
})
