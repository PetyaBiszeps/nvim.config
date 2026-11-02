-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.cmdheight = 0

-- Editing
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.virtualedit = "block"
vim.opt.mouse:append("c")

-- Navigation & Windows
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search & Replace
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- Files & Buffers
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.updatetime = 500
