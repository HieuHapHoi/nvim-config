local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  --Packer can manage itself
  use 'wbthomason/packer.nvim'

  --Theme
  use 'folke/tokyonight.nvim'

  --Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  --Lualine and Bufferline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons' }

  --Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  --Bracket
  use { "windwp/nvim-autopairs" }
  use { "p00f/nvim-ts-rainbow" }

  --Which Key
  use { "folke/which-key.nvim" }

  --Transparent
  use { "xiyaowong/nvim-transparent" }

  --Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --Auto Completion
  use { 'neovim/nvim-lspconfig' }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --LSP Installer
  use "williamboman/nvim-lsp-installer"

  --Git
  use {
    'lewis6991/gitsigns.nvim',
    --tag = 'release' -- To use the latest release
  }

  --Dashboard
  use { 'goolord/alpha-nvim', require 'alpha'.setup(require 'alpha.themes.dashboard'.config) }

  --Indent Line
  use "lukas-reineke/indent-blankline.nvim"

  --Terminal
  use 'akinsho/toggleterm.nvim'

  --Comment
  use 'terrortylor/nvim-comment'

  --LSPSaga

  --NullLS
  use "jose-elias-alvarez/null-ls.nvim"

  --DRP
  use "andweeb/presence.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
