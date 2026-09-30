local M = {}

function M.setup(ui2)
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

      row = math.floor(vim.o.lines * 0.4),
      col = math.floor((vim.o.columns - width) / 2),

      width = width,
      border = "rounded",

      _cmdline_offset = 0
    })

    vim.wo[win].winhighlight =
      "Normal:NormalFloat,FloatBorder:FloatBorder"

    local pos = vim.fn.screenpos(win, 1, 1)

    if pos.row > 0 then
      vim.g.ui_cmdline_pos = {
        pos.row,
        pos.col - 1
      }
    end
  end

  local cmdline_show = ui2.cmd.cmdline_show

  ui2.cmd.cmdline_show = function(...)
    cmdline_show(...)

    restore_cmdheight()
    style()
  end

  local cmdline_hide = ui2.cmd.cmdline_hide

  ui2.cmd.cmdline_hide = function(...)
    local result = cmdline_hide(...)

    vim.g.ui_cmdline_pos = nil

    return result
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
