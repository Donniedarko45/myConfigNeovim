vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.o.showtabline = 0
vim.opt.rtp:prepend(lazypath)
vim.o.swapfile = false
local lazy_config = require "configs.lazy"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

dofile(vim.g.base46_cache .. "defaults")
require "options"
require "nvchad.autocmds"
vim.schedule(function()
  require "mappings"
end)

require("colors").setup {
  alpha = 0.2,
}

vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
vim.o.wrap = true
vim.o.linebreak = true

require("lspconfig").prismals.setup {
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  settings = {
    prisma = {
      prismaFmtBinPath = "",
    },
  },
}

vim.cmd [[
  highlight StatusLine guibg=none
  highlight StatusLineNC guibg=none
]]

vim.cmd [[
  augroup Format
    autocmd!
    autocmd BufWritePost *.lua lua vim.lsp.buf.format({ async = true })
  augroup END
]]

vim.cmd [[
  autocmd BufNewFile,BufRead *.prisma set filetype=prisma
]]
vim.o.number = true
vim.opt.guicursor = ""

vim.wo.number = true
vim.wo.relativenumber = false

require("lspconfig").ts_ls.setup {
  on_attach = function(client, bufnr) end,

  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

require("lualine").setup {}

local lspconfig = require "lspconfig"
lspconfig.cssls.setup {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
