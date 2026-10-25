vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  severity_sort = true,

  signs = {
    text = {
      [1] = "E",
      [2] = "W",
      [3] = "I",
      [4] = "H"
    }
  },

  float = {
    header = false,
    border = "rounded",
    source = "if_many"
  },
  update_in_insert = false
})
