-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Function to bootstrap packer for when setting up on new machine
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
    -- MY PLUGINS
    use '~/Code/nvim-plugins/'

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
	-- Theme inspired by Atom
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-moon'
    end,
  })



	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'hrsh7th/cmp-nvim-lua'},
		}
  }

	use({
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		requires = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	})

	-- Useful plugin to show you pending keybinds.
	use({ 'folke/which-key.nvim', opts = {} })

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use('ThePrimeagen/harpoon')

	use('mbbill/undotree')

    use('lewis6991/gitsigns.nvim')

-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


