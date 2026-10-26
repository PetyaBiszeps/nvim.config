const statusline = require("mini.statusline")

statusline.setup({
  content = {
    active = function()
      local path = vim.fn.expand("%:.:h")
      local filename = vim.fn.expand("%:t")
      local branch = statusline.section_git({})
      local location = "%l:%c"
      local mode, mode_hl = statusline.section_mode({})


      if path == "." then
        path = ""
      end

      return statusline.combine_groups({
        { strings = { path, filename } },
        "%=",
        { strings = { branch, location } },
        { hl = mode_hl, strings = { mode } }
      })
    end
  },
  use_icons = true
})
