return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = { "ts_ls", "rust_analyzer" },
        automatic_installation = true,
    },
}


