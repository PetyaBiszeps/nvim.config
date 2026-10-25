local M = {}

function M.setup(ui2)
  if not ui2.cmd then
    return
  end

  local function restore_cmdheight()
    vim._with({
      noautocmd = true
    }, function()
      vim.o.cmdheight = 0
    end)
  end

  local function style()
    local win = ui2.wins.cmd

    if not vim.api.nvim_win_is_valid(win) then
      return
    end

    local width = math.max(1, math.min(60, vim.o.columns - 4))

    vim.api.nvim_win_set_config(win, {
      relative = "editor",
      anchor = "NW",

      row = math.floor(vim.o.lines * 0.38),
      col = math.floor((vim.o.columns - width) / 2),

      width = width,
      border = "rounded",

      title = " cmdline ",
      title_pos = "center"
    })
  end

  local cmdline_show = ui2.cmd.cmdline_show

  ui2.cmd.cmdline_show = function(...)
    cmdline_show(...)

    restore_cmdheight()
    style()
  end

  vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
      if vim.fn.getcmdtype() ~= "" then
        style()
      end
    end
  })
end

return M
