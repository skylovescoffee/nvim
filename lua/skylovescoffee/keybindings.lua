vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>Telescope live_grep<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>c', "ciw", {noremap = true, silent = true})


-- vim.api.nvim_set_keymap('n', '<leader>x', "gcc", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<leader>x', "gcc", {noremap = false, silent = true})
