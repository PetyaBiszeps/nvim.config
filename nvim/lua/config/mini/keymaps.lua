local map = vim.keymap.set
local pick = require("mini.pick")
local extra = require("mini.extra").pickers
local git = require("mini.git")
local diff = require("mini.diff")

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

map("n", "<leader>e", function()
  local files = require("mini.files")
  if not files.close() then
    local path = vim.api.nvim_buf_get_name(0)
    files.open(vim.uv.fs_stat(path) and path or vim.fn.getcwd())
  end
end, { desc = "File explorer (current file)" })

map("n", "<leader>ff", pick.builtin.files, { desc = "Files (cwd)" })
map("n", "<leader>fg", function()
  if vim.fn.executable("rg") ~= 1 then
    vim.notify("Live grep requires ripgrep (rg).", vim.log.levels.WARN)
    return
  end
  pick.builtin.grep_live({ tool = "rg", method = "plain" })
end, { desc = "Live grep (literal, smart case)" })
map("n", "<leader>fb", pick.builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fr", extra.oldfiles, { desc = "Recent files" })
map("n", "<leader>fl", function() extra.buf_lines({ scope = "current" }) end, { desc = "Buffer lines" })
map("n", "<leader>fh", pick.builtin.help, { desc = "Help" })
map("n", "<leader>f/", pick.builtin.resume, { desc = "Resume picker" })
map("n", "<leader>fc", function()
  pick.builtin.files({}, { source = { cwd = vim.fn.stdpath("config") } })
end, { desc = "Configuration files" })

map("n", "<leader>ls", function() extra.lsp({ scope = "document_symbol" }) end, { desc = "Document symbols" })
map("n", "<leader>lw", function() extra.lsp({ scope = "workspace_symbol_live" }) end, { desc = "Workspace symbols" })
map("n", "grr", function() extra.lsp({ scope = "references" }) end, { desc = "LSP references (picker)" })
map("n", "<leader>li", "<Cmd>LspTools<CR>", { desc = "Language server status" })
map("n", "<leader>d", extra.diagnostic, { desc = "Workspace diagnostics (picker)" })
map("n", "<leader>gs", "<Cmd>Git status --short<CR>", { desc = "Git status" })
map("n", "<leader>gd", "<Cmd>Git diff<CR>", { desc = "Unstaged diff" })
map("n", "<leader>gD", "<Cmd>Git diff --cached<CR>", { desc = "Staged diff" })
map("n", "<leader>gl", extra.git_commits, { desc = "Git commits" })
map("n", "<leader>gf", extra.git_files, { desc = "Git tracked files" })
map("n", "<leader>gh", extra.git_hunks, { desc = "Unstaged hunks (repository)" })
map("n", "<leader>gH", function() extra.git_hunks({ scope = "staged" }) end, { desc = "Staged hunks (repository)" })
map("n", "<leader>gb", "<Cmd>vertical Git blame -- %<CR>", { desc = "File blame" })
map({ "n", "x" }, "<leader>gi", git.show_at_cursor, { desc = "Git history / show at cursor" })
map("n", "<leader>go", diff.toggle_overlay, { desc = "Toggle inline diff overlay" })
map("n", "<leader>gq", function()
  vim.fn.setqflist({}, " ", { title = "Buffer hunks", items = diff.export("qf") })
  vim.cmd.copen()
end, { desc = "Loaded buffer hunks to quickfix" })

map("n", "<leader>ql", function() extra.list({ scope = "location" }) end, { desc = "Location list" })
map("n", "<leader>qf", function() extra.list({ scope = "quickfix" }) end, { desc = "Quickfix picker" })
map("n", "<leader>un", function() MiniNotify.show_history() end, { desc = "Notification history" })
