local pick = require("mini.pick")
pick.setup({
  window = {
    config = function()
      local width = math.max(1, math.min(100, math.floor(vim.o.columns * 0.85)))
      local height = math.max(1, math.min(30, math.floor(vim.o.lines * 0.65)))
      return {
        relative = "editor", anchor = "NW",
        width = width, height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.max(0, math.floor((vim.o.lines - height) / 2) - 1),
        border = "rounded",
      }
    end,
  },
})
require("mini.extra").setup()
vim.ui.select = pick.ui_select

-- netrw may not have created this group yet when setup runs during init.
vim.api.nvim_create_augroup("FileExplorer", { clear = true })
require("mini.files").setup({
  content = { filter = function() return true end }, -- Include dotfiles.
  mappings = { close = "<Esc>", go_in_plus = "<CR>", go_out = "<BS>", reset = "gR" },
  options = { permanent_delete = false, use_as_default_explorer = true },
  windows = { preview = true, max_number = 3, width_focus = 40, width_preview = 40 },
})
require("mini.git").setup()
require("mini.diff").setup({
  view = { style = "sign", signs = { add = "+", change = "~", delete = "-" } },
})
require("mini.sessions").setup({
  autoread = false,
  autowrite = false,
  file = "", -- Explicit named sessions in stdpath('state'), never project files.
  directory = vim.fn.stdpath("state") .. "/sessions",
  force = { read = false, write = false, delete = false },
})
