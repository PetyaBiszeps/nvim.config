local M = {
  languages = {},
  parsers = {},
  servers = {},
  tools = {}
}

local seen = {
  parsers = {},
  servers = {},
  tools = {}
}

local function extend_unique(kind, values)
  for _, value in ipairs(values or {}) do
    if not seen[kind][value] then
      seen[kind][value] = true
      table.insert(M[kind], value)
    end
  end
end

local dir = vim.fn.stdpath("config") .. "/lua/langs"
local names = {}

for name, type in vim.fs.dir(dir) do
  if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
    local module_name = name:gsub("%.lua$", "")
    table.insert(names, module_name)
  end
end

table.sort(names)

for _, name in ipairs(names) do
  local lang = require("langs." .. name)

  M.languages[name] = lang

  extend_unique("parsers", lang.parsers)
  extend_unique("servers", lang.servers)
  extend_unique("tools", lang.tools)
end

return M
