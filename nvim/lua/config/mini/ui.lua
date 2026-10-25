require("mini.icons").setup()
require("mini.statusline").setup({ use_icons = true })
require("mini.notify").setup({
  lsp_progress = { enable = false }, -- Statusline is enough; no progress popups.
  window = {
    config = function()
      return { anchor = "NE", col = vim.o.columns, row = 0, border = "rounded" }
    end,
    winblend = 0,
  },
})
vim.notify = MiniNotify.make_notify({ ERROR = { duration = 5000 } })

local clue = require("mini.clue")
local clues = {
  clue.gen_clues.square_brackets(),
  clue.gen_clues.builtin_completion(),
  clue.gen_clues.g(),
  clue.gen_clues.marks(),
  clue.gen_clues.registers(),
  clue.gen_clues.windows(),
  clue.gen_clues.z(),
}
for key, desc in pairs({
  b = "Buffers", f = "Find", g = "Git", l = "Language",
  n = "Notes", q = "Lists / quit", s = "Sessions", u = "UI / toggles",
}) do
  clues[#clues + 1] = { mode = "n", keys = "<Leader>" .. key, desc = "+" .. desc }
end
clue.setup({
  window = { delay = 300, config = { border = "rounded", width = "auto" } },
  triggers = {
    { mode = { "n", "x" }, keys = "<Leader>" },
    { mode = "n", keys = "[" }, { mode = "n", keys = "]" },
    { mode = { "n", "x" }, keys = "g" },
    { mode = { "n", "x" }, keys = "'" }, { mode = { "n", "x" }, keys = "`" },
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },
    { mode = "i", keys = "<C-x>" },
    { mode = "n", keys = "<C-w>" },
    { mode = { "n", "x" }, keys = "z" },
  },
  clues = clues,
})
