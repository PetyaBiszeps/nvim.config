const clue = require("mini.clue")

clue.setup({
  window = {
    delay = 300,

    config = {
      width = "auto",
      border = "rounded"
    }
  },

  triggers = {{
    mode = {
      "n", "x"
    },
    keys = "<Leader>"
  }, {
    mode = "n",
    keys = "<C-w>"
  }},

  clues = {
    { mode = "n", keys = "<Leader>f", desc = "+Find" },
    { mode = "n", keys = "<Leader>g", desc = "+Git" },
    clue.gen_clues.windows()
  }
})
