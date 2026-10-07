if not vim.pack then
  error("This config requires Neovim with vim.pack support")
end

vim.pack.add({
  -- Foundation
  {
    name = "jb.nvim",
    src = "https://github.com/nickkadutskyi/jb.nvim"
  }, {
    name = "nvim-treesitter",
    src = "https://github.com/nvim-treesitter/nvim-treesitter"
  },

  -- Completion
  {
    name = "blink.cmp",
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("1.*")
  },

  -- Language Services
  {
    name = "nvim-lspconfig",
    src = "https://github.com/neovim/nvim-lspconfig"
  }, {
    name = "mason.nvim",
    src = "https://github.com/mason-org/mason.nvim"
  }, {
    name = "mason-lspconfig.nvim",
    src = "https://github.com/mason-org/mason-lspconfig.nvim"
  }, {
    name = "conform.nvim",
    src = "https://github.com/stevearc/conform.nvim"
  },

  -- Editing
  {
    name = "nvim-autopairs",
    src = "https://github.com/windwp/nvim-autopairs"
  }, {
    name = "nvim-ts-autotag",
    src = "https://github.com/windwp/nvim-ts-autotag"
  },

  -- Git
  {
    name = "gitsigns.nvim",
    src = "https://github.com/lewis6991/gitsigns.nvim"
  }, {
    name = "diffview.nvim",
    src = "https://github.com/sindrets/diffview.nvim"
  },

  -- UI
  {
    name = "mini.icons",
    src = "https://github.com/nvim-mini/mini.icons"
  }, {
    name = "lualine.nvim",
    src = "https://github.com/nvim-lualine/lualine.nvim"
  }, {
    name = "incline.nvim",
    src = "https://github.com/b0o/incline.nvim"
  },

  -- Navigation
  {
    name = "fzf-lua",
    src = "https://github.com/ibhagwan/fzf-lua"
  }, {
    name = "oil.nvim",
    src = "https://github.com/stevearc/oil.nvim"
  }
})
