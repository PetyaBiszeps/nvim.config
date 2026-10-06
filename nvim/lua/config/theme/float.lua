local M = {}

function M.setup()
  local normal = vim.api.nvim_get_hl(0, {
    name = "Normal",
    link = false
  })

  for _, name in ipairs({ "NormalFloat", "FloatBorder" }) do
    local hl = vim.api.nvim_get_hl(0, {
      name = name,
      link = false
    })
    hl.bg = normal.bg
    vim.api.nvim_set_hl(0, name, hl)
  end
end

return M
