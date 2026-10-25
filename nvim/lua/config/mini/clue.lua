local clue = require("mini.clue")

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
    clue.gen_clues.windows()
  }
})
