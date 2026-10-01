local group = vim.api.nvim_create_augroup("diagnostic_float", {
  clear = true
})

vim.api.nvim_create_autocmd("CursorHold", {
  group = group,

  callback = function()
    if vim.fn.pumvisible() ~= 0 then
      return
    end

    vim.diagnostic.open_float({
      scope = "cursor",
      focusable = false,

      header = false,
      source = "if_many",
      border = "rounded",

      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "InsertEnter",
        "BufHidden"
      }
    })
  end
})
