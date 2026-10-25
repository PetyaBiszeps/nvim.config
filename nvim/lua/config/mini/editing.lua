require("mini.basics").setup({
  mappings = { windows = true, option_toggle_prefix = "" },
})
require("mini.ai").setup({ n_lines = 300 })
require("mini.align").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.bufremove").setup()
require("mini.bracketed").setup({
  indent = { suffix = "" }, -- mini.indentscope owns [i / ]i.
  treesitter = { suffix = "" }, -- No externally managed parser dependency.
})
require("mini.jump").setup({ delay = { highlight = 200 } })
require("mini.jump2d").setup({
  mappings = { start_jumping = "s" },
  view = { dim = true, n_steps_ahead = 1 },
})
local scope = require("mini.indentscope")
scope.setup({
  draw = { delay = 200, animation = scope.gen_animation.none() },
  options = { try_as_border = true },
})
require("mini.trailspace").setup()
require("mini.hipatterns").setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
  },
})

local group = vim.api.nvim_create_augroup("MiniEditingBuffers", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "help", "qf", "terminal", "minifiles", "minipick", "mininotify" },
  callback = function(args)
    vim.b[args.buf].miniindentscope_disable = true
    vim.b[args.buf].minitrailspace_disable = true
  end,
})
