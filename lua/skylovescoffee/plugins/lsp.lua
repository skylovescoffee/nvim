return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()

        local on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
            end

            map("n", "gd", vim.lsp.buf.definition, "LSP: go to definition")
            map("n", "gD", vim.lsp.buf.declaration, "LSP: go to declaration")
            map("n", "gr", vim.lsp.buf.references, "LSP: references")
            map("n", "gi", vim.lsp.buf.implementation, "LSP: implementation")
            map("n", "K", vim.lsp.buf.hover, "LSP: hover")
            map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: rename symbol")
            map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: code action")
            map("n", "<leader>oi", function()
                local params = vim.lsp.util.make_range_params()
                vim.lsp.buf.code_action({
                    context = {
                        only = { "source.organizeImports" },
                        diagnostics = {},
                    },
                    range = params.range,
                })
            end, "LSP: organize imports")
            map("n", "[d", vim.diagnostic.goto_prev, "LSP: prev diagnostic")
            map("n", "]d", vim.diagnostic.goto_next, "LSP: next diagnostic")
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        vim.lsp.config('ts_ls', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                typescript = {
                    preferences = {
                        includePackageJsonAutoImports = "on",
                        importModuleSpecifier = "relative",
                    },
                    suggest = {
                        autoImports = true,
                    },
                },
                javascript = {
                    preferences = {
                        includePackageJsonAutoImports = "on",
                        importModuleSpecifier = "relative",
                    },
                    suggest = {
                        autoImports = true,
                    },
                },
            },
        })
    end,
}


