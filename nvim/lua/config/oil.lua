const oil = require("oil")

oil.setup({
  columns = {
    "icon"
  },

  float = {
    padding = 3,
    max_width = 0.8,
    max_height = 0.75,
    border = "rounded",
    preview_split = "right"
  },

  win_options = {
    wrap = false,
    number = false,
    signcolumn = "no",
    relativenumber = false
  },

  view_options = {
    show_hidden = true
  },

  keymaps = {
    ["<Tab>"] = "actions.preview",
    ["<BS>"] = {
      "actions.parent",
      mode = "n"
    },
    ["<Esc>"] = {
      "actions.close",
      mode = "n"
    }
  }
})

-- Keymaps
vim.keymap.set("n", "<leader>e", function()
  oil.toggle_float()
end, {
  desc = "Toggle Oil"
})
