return {
  'nvim-telescope/telescope.nvim',
  dependencies = {'nvim-lua/plenary.nvim'},

  config = function()
    require('telescope').setup{
      defaults = {
        file_previewer = custom_previewer,
        path_display = { "truncate" }, -- truncate, absolute, shorten
        layout_config = {
          preview_width = 0.6,  -- Adjust as needed
          results_width = 0.4,  -- Adjust as needed
        },
      },
    };
    -- Keymaps
    local map = vim.api.nvim_set_keymap
    map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true, silent = true})
    map('n', '<leader>fg', '<cmd>Telescope git_files<CR>', {noremap = true, silent = true})
    map('n', '<leader>lg', '<cmd>Telescope live_grep<CR>', {noremap = true, silent = true})

  end
}




