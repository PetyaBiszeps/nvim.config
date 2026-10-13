const fzf = require("fzf-lua")

fzf.setup({
  "telescope"
})

-- Keymaps
vim.keymap.set("n", "<leader>f", function()
  fzf.files()
end, {
  desc = "Find files"
})

vim.keymap.set("n", "<leader>g", function()
  fzf.live_grep()
end, {
  desc = "Live grep"
})
