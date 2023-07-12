vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', 'ciw', { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- This code should be placed in your init.lua file, or a separate Lua file that you source from init.lua.
vim.api.nvim_set_keymap('n', '<Leader>yy', ':lua YankBufferToClipboard()<CR>', { noremap = true, silent = true })

function YankBufferToClipboard()
  -- The following command will yank all lines in the buffer
  vim.cmd('%y+')
end
