-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
  use( 'theprimeagen/harpoon' )
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('towolf/vim-helm')

  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
          require("null-ls").setup()
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

  use {
      "nathom/filetype.nvim",
      config = function()
          require("filetype").setup {
              overrides = {
                  extensions = {
                      tf = "terraform",
                      tfvars = "terraform",
                      tfstate = "json",
                  },
              },
          }
      end,
  }

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup()
      end
  }

  use({
      "arsham/arshamiser.nvim",
      requires = {
          "arsham/arshlib.nvim",
          "famiu/feline.nvim",
          "rebelot/heirline.nvim",
          "kyazdani42/nvim-web-devicons",
      },
      config = function()
          -- ignore any parts you don't want to use
          vim.cmd.colorscheme("arshamiser_light")
          require("arshamiser.feliniser")
          -- or:
          -- require("arshamiser.heirliniser")

          _G.custom_foldtext = require("arshamiser.folding").foldtext
          vim.opt.foldtext = "v:lua.custom_foldtext()"
          -- if you want to draw a tabline:
          vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
      end,
  })

end)
