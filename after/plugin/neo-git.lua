local neogit = require('neogit')

neogit.setup {
    integrations = {
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        -- use {
        --   'TimUntersberger/neogit',
        --   requires = {
        --     'nvim-lua/plenary.nvim',
        --     'sindrets/diffview.nvim'
        --   }
        -- }
        --
        diffview = true
  }
}

vim.keymap.set("n", "<leader>gs", ":Neogit<cr>")
vim.keymap.set("n", "<leader>gc", ":Neogit commit <cr>")
vim.keymap.set("n", "<leader>gp", ":Neogit push <cr>")
vim.keymap.set("n", "<leader>gd", ":Neogit diff <cr>")

