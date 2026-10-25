const pick = require("mini.pick")

pick.setup({
  window = {
    config = {
      border = "rounded"
    }
  }
})

-- Init
vim.ui.select = pick.ui_select
