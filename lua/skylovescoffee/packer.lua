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

end)

