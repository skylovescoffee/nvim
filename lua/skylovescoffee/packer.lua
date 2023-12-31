-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'  -- Keep this line, it's for packer itself.

    -- Add themes
    use 'folke/tokyonight.nvim'

    -- Add telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }


    -- Add completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Add vsnip for completion
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'


    -- Add commenting/uncommenting lines
    use {
        'numToStr/Comment.nvim',
        config = function()
        require('Comment').setup()
    	end
    }


    -- Add plenary 
    use "nvim-lua/plenary.nvim"


    -- Add null-ls
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Add ALE
    use 'dense-analysis/ale'

    -- Add NeoGit
    use 'NeogitOrg/neogit'

    -- Add Mason for easy LSP server installation
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }

    use "sindrets/diffview.nvim"

    -- Add Typescript
    use 'jose-elias-alvarez/typescript.nvim'

    -- Add undo tree
    use 'mbbill/undotree'

    -- Shoutout to the PRIMETIME
    use 'ThePrimeagen/harpoon'

    -- Add auto format for HTML + more in the future
    use 'vim-autoformat/vim-autoformat'

    -- Add auto pairs and tags
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    -- MIGHT REMOVE SINCE IT IS BARELY USED ***
    -- Add easy motion
    use {'phaazon/hop.nvim', 
         branch = 'v2' -- optional but heavily recommended
    }

    -- Add trouble for diagnostics
    use 'folke/trouble.nvim'

    -- 
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use 'nvim-pack/nvim-spectre'

    use "lukas-reineke/indent-blankline.nvim"


end)

