const lualine = require("lualine")

lualine.setup({
  options = {
    theme = "jb",

    component_separators = {
      left = "",
      right = ""
    },

    section_separators = {
      left = "",
      right = ""
    },
    globalstatus = true
  },

  sections = {
    lualine_a = {},
    lualine_b = {},

    lualine_c = {{
      "nav_bar",

      padding = {
        left = 1,
        right = 0
      }
    }, {
      "filename"
    }},
    lualine_x = {},

    lualine_y = {
      -- "lsp_status",
      "branch",
      "location"
    },

    lualine_z = {
      "mode"
    }
  }
})
