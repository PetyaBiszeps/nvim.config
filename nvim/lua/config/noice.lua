local noice = require("noice")

noice.setup({
  cmdline = {
    view = "cmdline_popup"
  },

  popupmenu = {
    enabled = true,
    backend = "nui"
  },

  messages = {
    view = "notify",
    view_error = "notify",
    view_warn = "notify"
  },

  notify = {
    enabled = true,
    view = "notify"
  },

  views = {
    notify = {
      backend = "notify"
    },

    -- Keep the completion menu from inheriting the global window border.
    popupmenu = {
      border = {
        style = "none"
      }
    },

    cmdline_popup = {
      position = {
        row = "40%",
        col = "50%"
      },

      size = {
        width = "auto",
        min_width = 20,
        max_width = 60
      },

      border = {
        style = "rounded"
      },

      win_options = {
        winhighlight = {
          Normal = "NormalFloat",
          FloatBorder = "FloatBorder",
          FloatTitle = "FloatTitle"
        }
      }
    }
  },

  presets = {
    long_message_to_split = true
  },

  -- Keep native LSP presentation and the existing completion setup.
  lsp = {
    progress = { enabled = false },
    hover = { enabled = false },
    signature = { enabled = false },
    message = { enabled = false }
  }
})

-- Wait for Noice to render before triggering native completion.
-- Do not restart completion when Tab changes the selected match.
vim.opt.wildmode = "noselect:lastused,full"
vim.opt.wildoptions:append("pum")

vim.api.nvim_create_autocmd("CmdlineChanged", {
  group = vim.api.nvim_create_augroup("cmdline_completion", { clear = true }),
  pattern = ":",
  callback = function()
    if vim.fn.wildmenumode() == 0 then
      vim.schedule(function()
        if vim.fn.getcmdtype() == ":" then
          vim.fn.wildtrigger()
        end
      end)
    end
  end
})
