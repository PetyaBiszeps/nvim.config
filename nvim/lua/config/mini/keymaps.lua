local files = require("mini.files")
local pick = require("mini.pick")
local extra = require("mini.extra").pickers
local git = require("mini.git")
local diff = require("mini.diff")
local snippets = require("mini.snippets")
local pairs = require("mini.pairs")


-- Keep the native menu unselected until Tab/Enter explicitly accepts an item.
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.completeopt = { "menuone", "noselect" }

-- Match blink's native-snippet backend: finish when reaching the final field.
vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("MiniSnippetNavigation", { clear = true }),
  pattern = "MiniSnippetsSessionJump",
  callback = function(args)
    if args.data.tabstop_to == "0" then snippets.session.stop() end
  end
})



-- Explorer
vim.keymap.set("n", "<leader>e", function()
  if not files.close() then
    local path = vim.api.nvim_buf_get_name(0)
    files.open(vim.uv.fs_stat(path) and path or vim.fn.getcwd())
  end
end, { desc = "File explorer (current file)" })

-- Find / Search
vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "Files (cwd)" })
vim.keymap.set("n", "<leader>fg", function()
  if vim.fn.executable("rg") ~= 1 then
    vim.notify("Live grep requires ripgrep (rg).", vim.log.levels.WARN)
    return
  end
  -- Match main's --smart-case without changing native search options.
  vim._with({ o = { ignorecase = true, smartcase = true } }, function()
    pick.builtin.grep_live({ tool = "rg", method = "plain" })
  end)
end, { desc = "Live grep (literal, smart case)" })

-- LSP / Diagnostics
vim.keymap.set("n", "grr", function() extra.lsp({ scope = "references" }) end, { desc = "LSP references (picker)" })
vim.keymap.set("n", "<leader>d", extra.diagnostic, { desc = "Workspace diagnostics (picker)" })

-- Git / Diff
vim.keymap.set("n", "<leader>gs", "<Cmd>Git status --short<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gd", "<Cmd>Git diff<CR>", { desc = "Unstaged diff" })
vim.keymap.set("n", "<leader>gD", "<Cmd>Git diff --cached<CR>", { desc = "Staged diff" })
vim.keymap.set("n", "<leader>gl", extra.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gf", extra.git_files, { desc = "Git tracked files" })
vim.keymap.set("n", "<leader>gh", extra.git_hunks, { desc = "Unstaged hunks (repository)" })
vim.keymap.set("n", "<leader>gH", function() extra.git_hunks({ scope = "staged" }) end, { desc = "Staged hunks (repository)" })
vim.keymap.set("n", "<leader>gb", "<Cmd>vertical Git blame -- %<CR>", { desc = "File blame" })
vim.keymap.set({ "n", "x" }, "<leader>gi", git.show_at_cursor, { desc = "Git history / show at cursor" })
vim.keymap.set("n", "<leader>go", diff.toggle_overlay, { desc = "Toggle inline diff overlay" })
vim.keymap.set("n", "<leader>gq", function()
  vim.fn.setqflist({}, " ", { title = "Buffer hunks", items = diff.export("qf") })
  vim.cmd.copen()
end, { desc = "Loaded buffer hunks to quickfix" })

-- Completion / Snippets
-- C-y alone cannot accept an unselected native popup: select its first item.
local function accept_completion()
  if vim.fn.pumvisible() == 0 then return nil end
  return vim.fn.complete_info().selected == -1 and "<C-n><C-y>" or "<C-y>"
end

local function jump_snippet(direction)
  local session = snippets.session.get()
  if not session or session.buf_id ~= vim.api.nvim_get_current_buf() then return false end
  -- Do not wrap backwards from the first field to the final tabstop.
  if direction == "prev" and session.tabstops[session.cur_tabstop].prev == "0" then return false end
  snippets.session.jump(direction)
  return true
end

vim.keymap.set("i", "<Tab>", function()
  local accept = accept_completion()
  if accept then return accept end
  if jump_snippet("next") then return "" end
  return "<Tab>"
end, {
  expr = true,
  desc = "Accept completion, next snippet field, or Tab"
})

vim.keymap.set("i", "<S-Tab>", function()
  return jump_snippet("prev") and "" or "<S-Tab>"
end, {
  expr = true,
  desc = "Previous snippet field or Shift-Tab"
})

vim.keymap.set("i", "<CR>", function()
  return accept_completion() or pairs.cr()
end, {
  expr = true,
  desc = "Accept completion or pair-aware newline"
})
