-- System clipboard with y
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local event = vim.v.event

    if event.operator == "y" and event.regname == "" then
      vim.fn.setreg("+", event.regcontents, event.regtype)
    end
  end
})
