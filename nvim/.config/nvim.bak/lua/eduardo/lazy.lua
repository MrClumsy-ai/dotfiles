-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS
local plugins = {

  -- Colorscheme
  { "ellisonleao/gruvbox.nvim",        priority = 1000,    config = true, opts = ... },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Harpoon
  { "ThePrimeagen/harpoon" },

  -- Undotree
  { "mbbill/undotree" },

  -- Fugitive
  { "tpope/vim-fugitive" },

  -- LSP
  { "VonHeikemen/lsp-zero.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "#{3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },

  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- Cursorline
  { "ya2s/nvim-cursorline" },

  -- Color by mode
  {
    "mawkler/modicator.nvim",
    dependencies = "ellisonleao/gruvbox.nvim",
    init = function()
      -- These are required for Modicator to work
      vim.o.number = true
      vim.o.termguicolors = true
    end,
  },

  -- Comments
  { "numToStr/Comment.nvim" },

  -- Oil / filetree
  {
    "stevearc/oil.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "_" },
        changedelete = { text = "~" },
      },
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- Load on file open
  },

  -- Something else
}
local opts = {}
require("lazy").setup(plugins, opts)
