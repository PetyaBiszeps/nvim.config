require("blink.cmp").setup({
  keymap = {
    preset = "default",

    ["<Tab>"] = {
      "select_and_accept",
      "snippet_forward",
      "fallback"
    },

    ["<S-Tab>"] = {
      "snippet_backward",
      "fallback"
    },

    ["<CR>"] = {
      "select_and_accept",
      "fallback"
    }
  },

  completion = {
    documentation = {
      auto_show = false
    },

    menu = {
      border = "rounded",
      winhighlight = table.concat({
        "Normal:NormalFloat", "FloatBorder:FloatBorder", "CursorLine:PmenuSel",
        "Search:None", "CurSearch:None"
      }, ",")
    }
  },

  sources = {
    default = {
      "lsp", "path", "snippets", "buffer"
    }
  }
})
