return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Load the colorscheme here
        vim.opt.termguicolors = true
        require("tokyonight").setup({
            style = "night",
            transparent = false,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
            },
        })
        -- Set colorscheme
        vim.cmd[[colorscheme tokyonight]]
    end,
} 