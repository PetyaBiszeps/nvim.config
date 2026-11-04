const diffbandit = require("diffbandit")

diffbandit.setup({

})

-- Keymaps
vim.keymap.set("n", "<leader>gd", function()
  diffbandit.git()
end, {
  desc = "Git diff"
})

vim.keymap.set("n", "<leader>gf", function()
  diffbandit.git_file()
end, {
  desc = "Git diff: Current file"
})

vim.keymap.set("n", "<leader>gl", function()
  diffbandit.git_log()
end, {
  desc = "Git log"
})
