return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local function goto_definition_or_references()
            local params = vim.lsp.util.make_position_params()
            vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx)
                if err then
                    vim.notify("LSP definition request failed: " .. tostring(err), vim.log.levels.ERROR)
                    return
                end
                if not result or vim.tbl_isempty(result) then
                    vim.notify("No definition found", vim.log.levels.INFO)
                    return
                end
                local locations = vim.islist(result) and result or { result }
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                local items = vim.lsp.util.locations_to_items(locations, client and client.offset_encoding)

                local seen = {}
                local deduped = {}
                for _, item in ipairs(items) do
                    local key = item.filename .. ":" .. item.lnum .. ":" .. item.col
                        .. ":" .. (item.end_lnum or item.lnum) .. ":" .. (item.end_col or item.col)
                    if not seen[key] then
                        seen[key] = true
                        table.insert(deduped, item)
                    end
                end

                local cursor = vim.api.nvim_win_get_cursor(0)
                local cursor_line, cursor_col = cursor[1], cursor[2]
                local current_file = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p")
                local on_definition = false
                for _, location in ipairs(deduped) do
                    if vim.fn.fnamemodify(location.filename, ":p") == current_file then
                        local start_line = location.lnum - 1
                        local start_col = location.col - 1
                        local end_line = (location.end_lnum or location.lnum) - 1
                        local end_col = (location.end_col or location.col) - 1
                        local after_start = cursor_line > start_line
                            or (cursor_line == start_line and cursor_col >= start_col)
                        local before_end = cursor_line < end_line
                            or (cursor_line == end_line and cursor_col <= end_col)
                        if after_start and before_end then
                            on_definition = true
                            break
                        end
                    end
                end
                if on_definition then
                    vim.lsp.buf.references()
                    return
                end

                if vim.tbl_isempty(deduped) then
                    vim.notify("No definition found", vim.log.levels.INFO)
                    return
                end

                if #deduped == 1 then
                    local item = deduped[1]
                    local b = item.bufnr or vim.fn.bufadd(item.filename)
                    vim.cmd("normal! m'")
                    vim.bo[b].buflisted = true
                    local w = vim.fn.win_findbuf(b)[1] or 0
                    vim.api.nvim_win_set_buf(w, b)
                    vim.api.nvim_win_set_cursor(w, { item.lnum, item.col - 1 })
                    vim.cmd("normal! zv")
                else
                    vim.fn.setqflist({}, " ", { title = "LSP locations", items = deduped })
                    vim.cmd("botright copen")
                end
            end)
        end

        local on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
            end

            map("n", "gd", goto_definition_or_references, "LSP: go to definition (or references on definition)")
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

        vim.lsp.config("ts_ls", {
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
        vim.lsp.enable("ts_ls")

        vim.lsp.config("rust_analyzer", {
            on_attach = on_attach,
            capabilities = capabilities,
        })
        vim.lsp.enable("rust_analyzer")
    end,
}


