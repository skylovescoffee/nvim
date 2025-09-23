return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    opts = {
        defaults = {
            mappings = {
                i = { ["<C-u>"] = false, ["<C-d>"] = false },
            },
        },
    },
}


