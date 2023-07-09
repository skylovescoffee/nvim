vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c', 'ciw', {noremap = true, silent = true})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

