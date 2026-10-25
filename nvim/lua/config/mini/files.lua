const files = require("mini.files")

files.setup({
  windows = {
    preview = true,
    max_number = 2,

    width_focus = 40,
    width_preview = 60
  },

  mappings = {
    reset = "gR",
    close = "<Esc>",
    go_out = "<BS>",
    go_in_plus = "<CR>"
  }
})
