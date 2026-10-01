const incline = require("incline")

incline.setup({
  render = function(props)
    local result = {}

    for severity = 1, 4 do
      local level = vim.diagnostic.severity[severity]

      local count = #vim.diagnostic.get(props.buf, {
        severity = level
      })

      if count > 0 then
        table.insert(result, {
          require("jb.icons").diagnostic[severity] .. " ",
          group = "DiagnosticSign" .. level
        })

        table.insert(result, {
          count .. " "
        })
      end
    end

    return result
  end
})
