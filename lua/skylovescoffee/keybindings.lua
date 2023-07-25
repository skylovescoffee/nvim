vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', 'ciw', { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- paste without yanking deleted word
vim.keymap.set("x", "p", [["_dP]])

vim.api.nvim_set_keymap('n', '<Leader>yy', ':lua YankBufferToClipboard()<CR>', { noremap = true, silent = true })

function YankBufferToClipboard()
  -- The following command will yank all lines in the buffer
  vim.cmd('%y+')
end

-- Easy motion, using "f" key inspired by vim-browser
vim.api.nvim_set_keymap('n', '<leader><leader>', ':HopWord<CR>', { noremap = true, silent = true })

-- Hover
vim.keymap.set("n", "<leader>d", ":lua vim.lsp.buf.hover()<CR>")

-- Remove search highlighting on escape
vim.keymap.set("n", "<esc>", "<esc>:noh<CR><esc>")
