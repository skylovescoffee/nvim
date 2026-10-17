return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = { "ts_ls", "rust_analyzer" },
        -- Keep auto-enabling every installed mason server (lua_ls, bashls,
        -- jsonls, ...), otherwise those filetypes lose LSP.
        automatic_enable = true,
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        -- `tsgo` is installed in mason but unused by this config, and
        -- nvim-lspconfig deprecates it. Left enabled it attaches a second
        -- TypeScript server alongside ts_ls, so gd/gr get duplicated or
        -- overridden results. Disable it and let ts_ls handle TypeScript.
        vim.lsp.enable("tsgo", false)
    end,
}
