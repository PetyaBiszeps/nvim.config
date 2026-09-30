local ui2 = require("vim._core.ui2")

ui2.enable()

-- Imports
require("core.ui.messages").setup(ui2)
require("core.ui.cmdline").setup(ui2)
