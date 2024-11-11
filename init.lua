vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.o.showtabline = 0
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      injector = {
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
        },
      },
    },
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- init.lua

require("colors").setup {
  alpha = 0.2, -- Adjust the alpha value for transparency
}
vim.opt.laststatus = 3

vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

vim.o.wrap = true
vim.o.linebreak = true -- Avoid breaking lines in the middle of words

require("lspconfig").prismals.setup {
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  settings = {
    prisma = {
      prismaFmtBinPath = "", -- Optional: specify Prisma format binary path if needed
    },
  },
}

vim.cmd [[
  autocmd BufNewFile,BufRead *.prisma set filetype=prisma
]]

require("noice").setup {
  background_colour = "#000000",
  lsp = {
    signature = {
      enabled = false,
    },
  },
}

vim.cmd [[
  highlight NotifyBackground guibg=#000000 ctermbg=black
]]

vim.cmd [[
  augroup Format
    autocmd!
    autocmd BufWritePost *.lua lua vim.lsp.buf.format({ async = true })
  augroup END
]]

vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers

-- Opens Superfile in a floating terminal
vim.api.nvim_set_keymap("n", "<leader>sf", ":lua OpenSuperfile()<CR>", { noremap = true, silent = true })

function OpenSuperfile()
  vim.cmd "belowright split | term superfile"
  vim.cmd "resize 20" -- Adjust height to your preference
end

-- init.lua
local neogit = require "neogit"
neogit.setup {}
