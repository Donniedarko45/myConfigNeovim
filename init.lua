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
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
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
require("lualine").setup {
  options = {
    theme = "auto",
  },
  sections = {
    lualine_c = { { "filename", color = { bg = "none" } } },
    lualine_x = { { "encoding", color = { bg = "none" } }, { "fileformat", color = { bg = "none" } } },
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
vim.o.number = true -- Enable line numbers

require("live-server").setup {
  args = { "--port=3000", "--open" },
}

require("better-comment").Setup()
vim.opt.guicursor = ""
