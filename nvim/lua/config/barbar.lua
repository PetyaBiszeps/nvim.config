const barbar = require("barbar")

barbar.setup({
  exclude_name = { "" }
})

-- Keymaps
vim.keymap.set("n", "<leader><Tab>", "<cmd>BufferNext<cr>", {
  desc = "Next buffer"
})

vim.keymap.set("n", "<leader><S-Tab>", "<cmd>BufferPrevious<cr>", {
  desc = "Previous buffer"
})

vim.keymap.set("n", "<leader>b", "<cmd>BufferPick<cr>", {
  desc = "Pick buffer"
})
