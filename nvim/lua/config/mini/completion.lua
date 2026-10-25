local snippets = require("mini.snippets")
snippets.setup({
  snippets = {
    { prefix = "date", body = "$CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE", desc = "ISO date" },
    snippets.gen_loader.from_lang(),
  },
  mappings = {
    expand = "<C-j>",
    jump_next = "<C-l>",
    jump_prev = "<C-h>",
    stop = "<C-c>",
  },
})
-- An in-process LSP source exposes our own snippets in the completion menu.
-- It is Lua from mini.nvim, not an executable or another plugin dependency.
snippets.start_lsp_server()

require("mini.completion").setup({
  delay = { completion = 120, info = 300, signature = 100 },
  window = {
    info = { border = "rounded", height = 15, width = 70 },
    signature = { border = "rounded", height = 8, width = 70 },
  },
  lsp_completion = {
    process_items = function(items, base)
      return MiniCompletion.default_process_items(items, base, { filtersort = "fuzzy" })
    end,
  },
})
-- Keep native completion semantics: Tab selects, Enter only accepts a selection.
-- Snippet jumping uses C-l / C-h so it never steals indentation or menu keys.
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, desc = "Next completion or indent" })
vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, desc = "Previous completion" })
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
    return "<C-y>"
  end
  return MiniPairs.cr()
end, { expr = true, desc = "Accept selected completion or newline" })

vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
