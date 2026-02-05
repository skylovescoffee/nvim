local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function path_relative_to(path, dir)
    dir = (dir or ""):gsub("/$", "")
    if dir == "" or path:sub(1, #dir) ~= dir then
        return path
    end
    local rel = path:sub(#dir + 2)
    return rel:sub(1, 1) == "/" and rel:sub(2) or rel
end

local function copy_path(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    local picker = action_state.get_current_picker(prompt_bufnr)
    local cwd = picker and picker.cwd or vim.fn.getcwd()
    local rel_path = path_relative_to(entry.path, cwd)
    actions.close(prompt_bufnr)
    vim.fn.setreg('"', rel_path)
    vim.fn.setreg("+", rel_path)
    vim.notify("Copied: " .. rel_path)
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    opts = {
        defaults = {
            file_ignore_patterns = { "node_modules" },
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                    ["<C-y>"] = copy_path,
                },
                n = {
                    ["y"] = copy_path,
                },
            },
        },
    },
}


