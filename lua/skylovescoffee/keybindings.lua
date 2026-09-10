vim.g.mapleader = " "
local function map(modes, lhs, rhs, opts)
  if vim.keymap and vim.keymap.set then
    vim.keymap.set(modes, lhs, rhs, opts)
    return
  end

  local legacy_opts = { noremap = true, silent = false }
  if opts then
    if opts.noremap ~= nil then
      legacy_opts.noremap = opts.noremap
    end
    if opts.silent ~= nil then
      legacy_opts.silent = opts.silent
    end
  end

  if type(modes) == "table" then
    for _, mode in ipairs(modes) do
      vim.api.nvim_set_keymap(mode, lhs, rhs, legacy_opts)
    end
    return
  end

  vim.api.nvim_set_keymap(modes, lhs, rhs, legacy_opts)
end
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', 'ciw', { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map({ "n", "v" }, "<leader>y", [["+y]])

-- paste without yanking deleted word
map("x", "p", [["_dP]])

vim.api.nvim_set_keymap('n', '<Leader>yy', ':lua YankBufferToClipboard()<CR>', { noremap = true, silent = true })

function YankBufferToClipboard()
  -- The following command will yank all lines in the buffer
  vim.cmd('%y+')
end

-- Easy motion, using "f" key inspired by vim-browser
vim.api.nvim_set_keymap('n', '<leader><leader>', ':HopWord<CR>', { noremap = true, silent = true })

-- Remove search highlighting on escape
map("n", "<esc>", "<esc>:noh<CR><esc>")

-- Telescope keybindings
map('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, { noremap = true, silent = true, desc = 'Telescope: find files' })

map('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, { noremap = true, silent = true, desc = 'Telescope: live grep' })

-- vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Find recent files' })

map('n', '<leader>fr', function()
  require('telescope.builtin').oldfiles()
end, { noremap = true, silent = true, desc = 'Telescope: recent files' })


vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float()
end, { desc = "Diagnostics float" })

vim.keymap.set("n", "<leader>a", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
