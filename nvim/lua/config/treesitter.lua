local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site")
})
treesitter.install(require("langs").parsers):wait(300000)

-- Init treesitter
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
