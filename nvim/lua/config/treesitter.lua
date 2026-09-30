local langs = require("langs")
local treesitter = require("nvim-treesitter")

local install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site")

treesitter.setup({
  install_dir = install_dir
})
treesitter.install(langs.parsers):wait(300000)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)

    if not ok then
      return
    end

    vim.bo[args.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
  end
})
