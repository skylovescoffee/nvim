require('plugins')

require('settings')

require('keybindings')


-- Source packer everyime plugins is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])



-- This line sets the colorscheme to Tokyo Night.
-- vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[colorscheme tokyonight-day]]

