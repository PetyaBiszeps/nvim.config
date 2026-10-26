local group = vim.api.nvim_create_augroup("CoreAutocmds", {
  clear = true
})
vim.cmd("filetype plugin indent on")

-- System clipboard with Y
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,

  callback = function()
    local event = vim.v.event

    if event.operator == "y" and event.regname == "" then
      vim.fn.setreg("+", event.regcontents, event.regtype)
    end
  end
})
