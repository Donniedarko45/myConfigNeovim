require "nvchad.options"
-- add yours here!

local o = vim.opt
o.relativenumber = true
require("gitsigns").setup {
  current_line_blame = false, -- Enable blame line by default
}
