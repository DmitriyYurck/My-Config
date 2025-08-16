-- UI Options
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
vim.keymap.set("n", "ww", ":w!<CR>")
vim.keymap.set("n", "qq", ":q!<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>r", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>k", ":WhichKey<CR>")
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>") -- Open Terminal
vim.keymap.set('t', '<leader>jj', [[<C-\><C-n>]])
vim.keymap.set('t', '<leader>h', [[<C-\>]])
vim.api.nvim_set_keymap("n", "df", ":noh<CR><Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Theme Toggle
vim.keymap.set("n", "<leader>tt", "<cmd>Telescope colorscheme<CR>", { desc = "Theme picker" })
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
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
  },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", config = function() require("bufferline").setup() end },
  -- ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
      })
    end
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
            require('crates').setup()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 'lua', 'python', 'rust', "cpp", "c" },
                highlight = { enable = true },
                indent = { enable = true },
            }
    end
    }
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
