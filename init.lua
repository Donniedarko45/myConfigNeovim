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
require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
-- init.lua
require("colors").setup {
  alpha = 0.2, -- Adjust the alpha value for transparency
}
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

vim.opt.guicursor = ""

vim.wo.number = true
vim.wo.relativenumber = false

-- TypeScript/JavaScript LSP setup
require("lspconfig").ts_ls.setup {
  on_attach = function(client, bufnr)
    -- Optional: Disable tsserver's formatting in favor of a formatter like Prettier or ESLint
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,

  -- Optional: Add capabilities for better autocompletion with nvim-cmp
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
