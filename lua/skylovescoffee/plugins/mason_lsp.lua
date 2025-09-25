return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = { "ts_ls" },
        automatic_installation = true,
    },
}


