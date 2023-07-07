require('telescope').setup{
  defaults = {
    path_display = { "shorten" }, -- truncate, absolute, shorten
    layout_config = {
      preview_width = 0.4,  -- Adjust as needed
      results_width = 0.6,  -- Adjust as needed
    },
  },
}
