local map = vim.keymap.set
local pick = require("mini.pick")
local extra = require("mini.extra").pickers
local git = require("mini.git")
local diff = require("mini.diff")
local notes = require("config.mini.notes")

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

map("n", "<leader>bd", function() require("mini.bufremove").delete() end, { desc = "Delete buffer (keep splits)" })
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

map("n", "<leader>nd", notes.daily, { desc = "Daily Markdown note" })
map("n", "<leader>nf", function() notes.pick(false) end, { desc = "Find notes" })
map("n", "<leader>ns", function() notes.pick(true) end, { desc = "Search notes" })
map("n", "<leader>nw", notes.workspace, { desc = "Choose notes workspace" })
map("n", "<leader>ss", function()
  vim.ui.input({ prompt = "Session name: " }, function(name)
    if not name or name == "" then return end
    if name:find("[/\\]") or name == "." or name == ".." then
      vim.notify("Use a session name, not a path.", vim.log.levels.WARN)
      return
    end
    require("mini.sessions").write(name)
  end)
end, { desc = "Save named session (no overwrite)" })
map("n", "<leader>sl", function() require("mini.sessions").select("read") end, { desc = "Load session" })
map("n", "<leader>sd", function() require("mini.sessions").select("delete") end, { desc = "Delete inactive session" })

map("n", "<leader>ql", function() extra.list({ scope = "location" }) end, { desc = "Location list" })
map("n", "<leader>qf", function() extra.list({ scope = "quickfix" }) end, { desc = "Quickfix picker" })
map("n", "<leader>un", function() MiniNotify.show_history() end, { desc = "Notification history" })
map("n", "<leader>ux", function() require("mini.trailspace").trim() end, { desc = "Trim trailing whitespace" })
