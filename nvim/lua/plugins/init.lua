if not vim.pack then
  error("This config requires Neovim with vim.pack support")
end

vim.pack.add({
  -- Foundation
  {
    name = "mini.nvim",
    src = "https://github.com/nvim-mini/mini.nvim"
  }, {
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter"
  }, {
    name = "jb.nvim",
    src = "https://github.com/nickkadutskyi/jb.nvim"
  },

  -- Package Manager
  {
    name = "mason.nvim",
    src = "https://github.com/mason-org/mason.nvim"
  }, {
    name = "mason-lspconfig.nvim",
    src = "https://github.com/mason-org/mason-lspconfig.nvim"
  },

  -- LSP
  {
    name = "nvim-lspconfig",
    src = "https://github.com/neovim/nvim-lspconfig"
  },

  -- Formatting
  {
    name = "conform.nvim",
    src = "https://github.com/stevearc/conform.nvim"
  }
})
