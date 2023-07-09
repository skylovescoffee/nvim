require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
        on_attach = ...,
    },
})


vim.api.nvim_set_keymap('n', '<leader>mi', ':TypescriptAddMissingImports<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ru', ':TypescriptRemoveUnused<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>oi', ':TypescriptOrganizeImports<CR>', {noremap = true, silent = true})
