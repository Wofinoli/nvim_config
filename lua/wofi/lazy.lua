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


require('lazy').setup("wofi.plugins")
---- Only required if you have packer configured as `opt`
--  -- Packer can manage itself
--  use 'wbthomason/packer.nvim'
--
--  use {
--	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
--	  -- or                            , branch = '0.1.x',
--	  requires = { {'nvim-lua/plenary.nvim'} }
--  }
--  use {
--	  'nvim-treesitter/nvim-treesitter',
--	  run = function()
--		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
--		  ts_update()
--	  end,
--  }
--
--  use({ 'rose-pine/neovim', as = 'rose-pine' })
--
--	use {
--		"nvim-neorg/neorg",
--		config = function()
--			require('neorg').setup {
--				load = {
--					["core.defaults"] = {}, -- Loads default behaviour
--					["core.concealer"] = {  -- Adds pretty icons to your documents
--            config = {
--              folds = false,
--            },
--          },
--					["core.dirman"] = { -- Manages Neorg workspaces
--					config = {
--						workspaces = {
--							notes = "~/notes",
----              writing = "~/writing",
--						},
--					},
--				},
--			},
--		}
--		end,
--		run = ":Neorg sync-parsers",
--		requires = "nvim-lua/plenary.nvim",
--	}  
--
--  use 'tpope/vim-fugitive'
--  use 'theprimeagen/harpoon'
