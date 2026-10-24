const obsidian = require("obsidian")

obsidian.setup({
  picker = {
    name = "fzf-lua"
  },

  daily_notes = {
    date_format= "DD-MM-YYYY",
    workdays_only = false
  },

  workspaces = {{
    name = "personal",
    path = "~/Documents/notes/personal"
  }, {
    name = "work",
    path = "~/Documents/notes/work"
  }},
  legacy_commands = false
})

-- Keymaps
vim.keymap.set("n", "<leader>nd", "<cmd>Obsidian today<cr>", {
  desc = "Notes: Daily"
})

vim.keymap.set("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", {
  desc = "Notes: Find"
})

vim.keymap.set("n", "<leader>ns", "<cmd>Obsidian search<cr>", {
  desc = "Notes: Search"
})
