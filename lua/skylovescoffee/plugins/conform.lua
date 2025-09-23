return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            python = { "black" },
            go = { "gofmt" },
        },
        format_on_save = function(bufnr)
            -- disable for huge files
            local max_filesize = 2 * 1024 * 1024 -- 2MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
            if ok and stats and stats.size > max_filesize then
                return
            end
            return { lsp_fallback = true, timeout_ms = 1000 }
        end,
    },
}


