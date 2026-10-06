const theme = require("jb")

theme.setup({

})

-- Choose theme styling
vim.o.background = "dark"
vim.cmd.colorscheme("jb")

-- Imports
require("config.theme.float").setup()
