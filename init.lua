vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Leader Key
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "ww", ":w<CR>")
vim.keymap.set("n", "qq", ":q!<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>r", ":Telescope live_grep<CR>") -- replaced grep_string
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>k", ":WhichKey<CR>")

-- Theme Toggle
local current_theme = "poimandres"
vim.keymap.set("n", "<leader>tt", function()
  if current_theme == "poimandres" then
    vim.g.everforest_background = "soft"
    vim.g.everforest_enable_italic = true
    vim.cmd("colorscheme everforest")
    require("lualine").setup({
      options = {
        theme = "everforest",
        section_separators = "",
        component_separators = ""
      }
    })
    current_theme = "everforest"
  else
    require("poimandres").setup({})
    vim.cmd("colorscheme poimandres")
    require("lualine").setup({
      options = {
        theme = "poimandres",
        section_separators = "",
        component_separators = ""
      }
    })
    current_theme = "poimandres"
  end
end)

-- Lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Setup
require("lazy").setup({
  "nvim-tree/nvim-tree.lua",
  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope.nvim",
  "mbbill/undotree",
  { "olivercederborg/poimandres.nvim", lazy = false, priority = 1000 },
  { "sainnhe/everforest", lazy = false, priority = 1000 },
  "windwp/nvim-autopairs",
  "folke/which-key.nvim",
})

-- Initial Theme Setup
require("poimandres").setup({})
vim.cmd.colorscheme "poimandres"
require("lualine").setup({
  options = {
    theme = "poimandres",
    section_separators = "",
    component_separators = "",
  },
})

-- NvimTree Setup
require("nvim-tree").setup({
  view = { width = 30 },
  renderer = {
    highlight_git = true,
    icons = { show = { file = true, folder = true } },
  },
})

-- Treesitter Setup
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "rust", "typescript", "json", "html", "css" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- LSP Setup
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup({ capabilities = capabilities })
lspconfig.ts_ls.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })

-- CMP Setup
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- Misc Plugin Setups
require("nvim-autopairs").setup({})
require("telescope").setup({})
require("which-key").setup({})
