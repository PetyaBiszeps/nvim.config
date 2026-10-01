const gitsigns = require("gitsigns")

gitsigns.setup({
  current_line_blame = true,

  current_line_blame_opts = {
    delay = 400,
    use_focus = true,
    virt_text = true,
    virt_text_pos = "eol",
    ignore_whitespace = false,
    virt_text_priority = 100
  },

  current_line_blame_formatter =
    "<author>, <author_time:%d/%m/%Y>, <author_time:%H:%M> · <summary>"
})
