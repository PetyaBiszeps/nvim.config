-- Plain Markdown convenience, deliberately not an Obsidian implementation.
local M = {}
local workspaces = {
  personal = vim.fn.expand("~/Documents/notes/personal"),
  work = vim.fn.expand("~/Documents/notes/work"),
}
local active = "personal"

local function root()
  return workspaces[active]
end

function M.workspace()
  vim.ui.select({ "personal", "work" }, { prompt = "Notes workspace" }, function(choice)
    if choice then active = choice end
  end)
end

function M.daily()
  local dir = root() .. "/daily"
  vim.fn.mkdir(dir, "p")
  vim.cmd.edit(vim.fn.fnameescape(dir .. "/" .. os.date("%d-%m-%Y") .. ".md"))
end

function M.pick(search)
  local path = root()
  if vim.fn.isdirectory(path) == 0 then
    vim.notify("Notes directory does not exist: " .. path, vim.log.levels.WARN)
    return
  end
  local opts = { source = { cwd = path, name = "Notes: " .. active } }
  if search then
    if vim.fn.executable("rg") ~= 1 then
      vim.notify("Live grep requires ripgrep (rg).", vim.log.levels.WARN)
      return
    end
    require("mini.pick").builtin.grep_live({ tool = "rg", method = "plain" }, opts)
  else
    require("mini.pick").builtin.files({}, opts)
  end
end
return M
