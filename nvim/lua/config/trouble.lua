const trouble = require("trouble")

trouble.setup({
  focus = true,

  win = {
    size = 0.35
  }
})

-- Keymaps
vim.keymap.set("n", "<leader>d", function()
  trouble.toggle("diagnostics")
end, {
  desc = "Diagnostics"
})
