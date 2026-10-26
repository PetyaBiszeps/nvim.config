const git = require("mini.git")
const diff = require("mini.diff")

git.setup({

})

diff.setup({
  view = {
    style = "sign",

    signs = {
      add = "+",
      change = "~",
      delete = "-"
    }
  }
})
