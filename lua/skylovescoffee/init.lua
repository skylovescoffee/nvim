
-- Load initial configurations
require("skylovescoffee.keybindings")
require("skylovescoffee.settings")

-- Initialize package manager after vim is ready
require("skylovescoffee.lazy_init").setup()

-- Load other configurations

-- Call the function on every buffer read or file open event
-- vim.cmd [[autocmd BufReadPost,BufNewFile * lua require('skylovescoffee.prettier').set_tab_width_from_prettier()]]
