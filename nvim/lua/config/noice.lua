const noice = require("noice")

noice.setup({
  cmdline = {
    view = "cmdline_popup"
  },

  popupmenu = {
    enabled = false
  },

  messages = {
    view = "notify",
    view_error = "notify",
    view_warn = "notify"
  },

  notify = {
    enabled = true,
    view = "notify"
  },

  views = {
    notify = {
      backend = "notify"
    },

    cmdline_popup = {
      position = {
        row = "40%",
        col = "50%"
      },

      size = {
        width = "auto",
        min_width = 40,
        max_width = 65
      },

      border = {
        style = "rounded"
      },

      win_options = {
        winhighlight = {
          Normal = "NormalFloat",
          FloatBorder = "FloatBorder",
          FloatTitle = "FloatTitle"
        }
      }
    }
  },

  presets = {
    long_message_to_split = true
  },

  lsp = {
    progress = {
      enabled = false
    },
    hover = {
      enabled = false
    },
    signature = {
      enabled = false
    },
    message = {
      enabled = false
    }
  }
})
