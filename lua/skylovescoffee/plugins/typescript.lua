return {
  'jose-elias-alvarez/typescript.nvim',
  dependencies = {
    'neovim/nvim-lspconfig'
  },
  config = function()
      require("typescript").setup({
          disable_commands = false, -- prevent the plugin from creating Vim commands
          debug = false, -- enable debug logging for commands
          go_to_source_definition = {
              fallback = true, -- fall back to standard LSP definition on failure
          },
          server = {
          on_attach = function(client, bufnr)
            -- your other on_attach stuff here if you have any
            -- ...
            vim.lsp.buf.inlay_hint(bufnr, true)
          end,
          settings={
            -- specify some or all of the following settings if you want to adjust the default behavior
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },
      })


      vim.api.nvim_set_keymap('n', '<leader>mi', ':TypescriptAddMissingImports<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>ru', ':TypescriptRemoveUnused<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>oi', ':TypescriptOrganizeImports<CR>', {noremap = true, silent = true})
  end
}
