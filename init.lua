require('skylovescoffee')

-- Source packer everyime plugins is updated
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Add themes
    {'folke/tokyonight.nvim',
    	lazy = true,
    },
    { 'rose-pine/neovim', name = 'rose-pine',
    	lazy = false,
    	priority = 1000,
      config = function()
		    vim.cmd.colorscheme 'rose-pine'
    	end,
    },
    -- Add commenting/uncommenting lines
    {
      'numToStr/Comment.nvim',
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        require('Comment').setup()
      end
    },

    -- Add ALE
    {'dense-analysis/ale',
      config = function()
        vim.g.ale_linters = {
            javascript = {'prettier', 'eslint'},
            typescript = {'prettier', 'eslint'},
            javascriptreact = {'prettier', 'eslint'},
            typescriptreact = {'prettier', 'eslint'},
            rust = { 'analyzer' }
        }

        vim.g.ale_fixers = {
            javascript = {'prettier', 'eslint'},
            typescript = {'prettier', 'eslint'},
            javascriptreact = {'prettier', 'eslint'},
            typescriptreact = {'prettier', 'eslint'},
        }
        vim.g.ale_fix_on_save = 1
      end
    },

    -- Add NeoGit
    {'NeogitOrg/neogit',
      dependencies = { "sindrets/diffview.nvim", 'nvim-lua/plenary.nvim'},
      config = function()
        local neogit = require('neogit')
        neogit.setup {
            integrations = {
                diffview = true
          }
        }
        local map = vim.keymap.set
        map("n", "<leader>gs", ":Neogit<cr>")
        map("n", "<leader>gc", ":Neogit commit <cr>")
        map("n", "<leader>gp", ":Neogit push <cr>")
        map('n', '<leader>fh', ':DiffviewFileHistory %<cr>')
        -- map("n", "<leader>df", ":Neogit diff <cr>")
      end

    },

    -- Add undo tree
    {
      'mbbill/undotree',
      config = function()
        vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
      end

    },

    -- Shoutout to the PRIMETIME
    {'ThePrimeagen/harpoon',
      config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local map = vim.keymap.set

        map("n", "<leader>a", mark.add_file)
        map("n", "<leader>h", ui.toggle_quick_menu)

        map("n", "<leader>1", function() ui.nav_file(1) end)
        map("n", "<leader>2", function() ui.nav_file(2) end)
        map("n", "<leader>3", function() ui.nav_file(3) end)
        map("n", "<leader>4", function() ui.nav_file(4) end)
        map("n", "<leader>5", function() ui.nav_file(5) end)
      end
    },


    -- Add auto pairs and tags
    {'windwp/nvim-autopairs'},
    {'windwp/nvim-ts-autotag'},

    -- Add trouble for diagnostics
    {'folke/trouble.nvim'},

    {'nvim-pack/nvim-spectre',
      dependencies = {'nvim-lua/plenary.nvim'},
    },

    -- Add auto format for HTML + more in the future
    require 'skylovescoffee.plugins.telescope',
    require 'skylovescoffee.plugins.treesitter',
    require 'skylovescoffee.plugins.coc',
}


vim.g.mapleader = " "
vim.g.localmapleader = " "

require("lazy").setup(plugins, {})
