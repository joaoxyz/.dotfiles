-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 5
vim.opt.splitright = true
vim.opt.splitbelow = true 
-- vim.opt.autowriteall = true 

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require("lualine").setup {
          options = {
            theme = 'gruvbox-material',
            section_separators = '',
            component_separators = ''
          }
        }
    end,  
    },
    {
      'ellisonleao/gruvbox.nvim', 
      lazy = false,
      priority = 1000,
      config = function() 
        vim.cmd.colorscheme "gruvbox"
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = { "lua", "vimdoc", "c", "rust", "python", "javascript", "html", "css", "bash", "sql" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
      end,
    },
    'tpope/vim-sleuth',
    'numToStr/Comment.nvim',
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { 
    enabled = true,
    notify = false
  },
  rocks = {
    enabled = false,
  }
})

