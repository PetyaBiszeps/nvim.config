const flash = require("flash")

flash.setup({
  jump = {
    autojump = true
  }
})

-- Keymaps
vim.keymap.set({ "n", "x", "o" }, "s", function()
  flash.jump()
end, {
  desc = "Flash"
})
