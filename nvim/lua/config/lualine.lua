require("lualine").setup({
  options = {
    theme = "jb",
    globalstatus = true,

    component_separators = {
      left = "",
      right = ""
    },

    section_separators = {
      left = "",
      right = ""
    }
  },

  sections = {
    lualine_a = {},
    lualine_b = {},

    lualine_c = {
      {
        "nav_bar",

        padding = {
          left = 1,
          right = 0
        }
      },

      {
        "filename",
        path = 0
      }
    },

    lualine_x = {},

    lualine_y = {
      "lsp_status",
      "branch",
      "location"
    },

    lualine_z = {
      "mode"
    }
  }
})
