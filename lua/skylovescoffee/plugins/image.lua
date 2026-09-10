return {
    "3rd/image.nvim",
    build = false,
    event = { "BufEnter *.png", "BufEnter *.jpg", "BufEnter *.jpeg", "BufEnter *.gif", "BufEnter *.webp" },
    config = function()
        require("image").setup({
            backend = "kitty",
            integrations = {
                markdown = {
                    enabled = true,
                    clear_in_insert_mode = false,
                    download_remote_images = true,
                    only_render_image_at_cursor = false,
                    filetypes = { "markdown", "vimwiki" },
                },
                neorg = { enabled = false },
            },
            max_width_window_percentage = 100,
            max_height_window_percentage = 60,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        })
    end,
}
