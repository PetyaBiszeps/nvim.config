require("conform").setup({
  formatters_by_ft = {
    go = {
      "gofmt"
    },

    python = {
      "ruff_fix", "ruff_format"
    },

    php = {
      "pint"
    }
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "never"
  },
  notify_on_error = true,
  notify_no_formatters = false
})
