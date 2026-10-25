const notify = require("mini.notify")

notify.setup({
  lsp_progress = {
    enable = false
  },

  window = {
    config = {
      border = "rounded"
    },
    winblend = 0
  }
})

-- Init
vim.notify = notify.make_notify({
  ERROR = {
    duration = 5000
  }
})
