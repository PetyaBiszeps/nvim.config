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
  fzf.live_grep({
    rg_opts = table.concat({
      "--column",
      "--line-number",
      "--no-heading",
      "--color=always",
      "--smart-case",
      "--max-columns=4096",
      "--fixed-strings",
      "-e"
    }, " ")
  })
end, {
  desc = "Live grep"
})

vim.keymap.set("n", "grr", function()
  fzf.lsp_references()
end, {
  desc = "LSP references"
})
