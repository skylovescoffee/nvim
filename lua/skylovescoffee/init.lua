require("skylovescoffee.packer")
require("skylovescoffee.keybindings")
require("skylovescoffee.settings")
require("skylovescoffee.theme")

-- Call the function on every buffer read or file open event
vim.cmd [[autocmd BufReadPost,BufNewFile * lua require('skylovescoffee.prettier').set_tab_width_from_prettier()]]
