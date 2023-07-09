vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c', 'ciw', {noremap = true, silent = true})

