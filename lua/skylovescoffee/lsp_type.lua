local api = vim.api

local M = {}

local MAX_LINES = 150

local function get_ts_client(bufnr)
    return vim.lsp.get_clients({ bufnr = bufnr, name = "ts_ls" })[1]
end

local function reindent(lines)
    if #lines == 0 then
        return lines
    end
    local indent = lines[1]:match("^(%s*)") or ""
    if #indent == 0 then
        return lines
    end
    for i, line in ipairs(lines) do
        lines[i] = line:sub(#indent + 1)
    end
    return lines
end

local function show_block(lines)
    vim.lsp.util.open_floating_preview(lines, "typescript", {
        border = "rounded",
        focusable = true,
        max_width = 120,
        max_height = 30,
    })
end

local function hover_fallback(client, bufnr)
    local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
    client.request("textDocument/hover", params, function(err, result)
        if err or not (result and result.contents) then
            vim.notify("No type information", vim.log.levels.INFO)
            return
        end
        vim.lsp.handlers.hover(nil, result, {
            method = "textDocument/hover",
            bufnr = bufnr,
            client_id = client.id,
        }, {})
    end, bufnr)
end

local function is_lib_declaration(name)
    return name:match("typescript[/\\]lib[/\\]lib%.") ~= nil
end

local function find_block(bufnr, start_line, start_char)
    local lines = api.nvim_buf_get_lines(bufnr, start_line, -1, false)
    local out = {}
    local depth = 0
    local started = false
    local in_str = false
    local str_char = ""
    local in_line_comment = false
    local in_block_comment = false

    for li, raw in ipairs(lines) do
        if #out >= MAX_LINES then
            break
        end
        local i = 1
        if li == 1 then
            i = math.max(1, start_char + 1)
        end
        local char = raw:sub(i, i)
        while char ~= "" do
            if in_line_comment then
                -- rest of line ignored
                break
            elseif in_block_comment then
                if char == "*" and raw:sub(i + 1, i + 1) == "/" then
                    in_block_comment = false
                    i = i + 1
                end
            elseif in_str then
                if char == "\\" then
                    i = i + 1
                elseif char == str_char then
                    in_str = false
                end
            else
                if char == '"' or char == "'" or char == "`" then
                    in_str = true
                    str_char = char
                elseif char == "/" and raw:sub(i + 1, i + 1) == "/" then
                    in_line_comment = true
                    break
                elseif char == "/" and raw:sub(i + 1, i + 1) == "*" then
                    in_block_comment = true
                    i = i + 1
                elseif char == "{" then
                    started = true
                    depth = depth + 1
                elseif char == "}" then
                    if started then
                        depth = depth - 1
                    end
                end
            end
            i = i + 1
            char = raw:sub(i, i)
        end

        if started and li == 1 then
            out[#out + 1] = raw
        elseif started then
            out[#out + 1] = raw
        end

        if started then
            if depth <= 0 then
                break
            end
        end
    end

    if not started or #out == 0 then
        return nil
    end
    return out
end

function M.show_full_type()
    local bufnr = api.nvim_get_current_buf()
    local client = get_ts_client(bufnr)
    if not client then
        vim.lsp.buf.hover()
        return
    end

    local params = vim.lsp.util.make_position_params(0, client.offset_encoding)

    client.request("textDocument/typeDefinition", params, function(err, td)
        local item = (not err) and td and td[1]
        if not (item and item.uri and item.range) then
            hover_fallback(client, bufnr)
            return
        end

        local dbuf = vim.uri_to_bufnr(item.uri)
        if not api.nvim_buf_is_loaded(dbuf) then
            local ok = pcall(vim.fn.bufload, dbuf)
            if not ok then
                hover_fallback(client, bufnr)
                return
            end
        end

        if is_lib_declaration(api.nvim_buf_get_name(dbuf)) then
            hover_fallback(client, bufnr)
            return
        end

        local block = find_block(dbuf, item.range.start.line, item.range.start.character)
        if not block then
            hover_fallback(client, bufnr)
            return
        end

        show_block(reindent(block))
    end, bufnr)
end

return M