-- const git = require("mini.git")
-- const diff = require("mini.diff")
const pick = require("mini.pick")
const files = require("mini.files")
const extra = require("mini.extra")

-- Explorer
vim.keymap.set("n", "<leader>e", function()
  if not files.close() then
    local path = vim.api.nvim_buf_get_name(0)
    files.open(vim.uv.fs_stat(path) and path or vim.fn.getcwd())
  end
end, {
  desc = "File explorer"
})

-- Search
vim.keymap.set("n", "<leader>ff", pick.builtin.files, {
  desc = "Find files"
})

vim.keymap.set("n", "<leader>fg", function()
  vim._with({ o = { ignorecase = true, smartcase = true } }, function()
    pick.builtin.grep_live({
      tool = "rg",
      method = "plain"
    })
  end)
end, {
  desc = "Live grep"
})

-- LSP / Diagnostics
vim.keymap.set("n", "grr", function()
  extra.pickers.lsp({
    scope = "references"
  })
end, {
  desc = "LSP references"
})

vim.keymap.set("n", "<leader>d", extra.pickers.diagnostic, {
  desc = "Diagnostics"
})
