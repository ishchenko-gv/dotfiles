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
  use 'wbthomason/packer.nvim' -- plugin manager
  use 'ellisonleao/gruvbox.nvim' -- theme
  use 'sainnhe/everforest'
  use 'sainnhe/sonokai'
  use 'connorholyday/vim-snazzy'
  use 'nvim-tree/nvim-tree.lua' -- file tree sidebar
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim' -- status bar below
  use 'nvim-treesitter/nvim-treesitter' -- language parser, needed for other plugins
  use { -- LSP, language server protocol, used for go-to, hover, completion, etc
    'williamboman/mason.nvim', -- LSP package manager
    'williamboman/mason-lspconfig.nvim', -- bridge between Mason and lsp-config
    'neovim/nvim-lspconfig' -- configs lib for LSP
  }
  use {
    'nvim-telescope/telescope.nvim', -- file search
    tag = '0.1.6',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
  use 'hrsh7th/nvim-cmp' -- autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/luaSnip' -- snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'christoomey/vim-tmux-navigator'
  use 'alvan/vim-closetag'
  use 'lewis6991/gitsigns.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
