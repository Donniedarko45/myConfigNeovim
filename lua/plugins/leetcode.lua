return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    injector = {
      ["cpp"] = {
        before = { "#include <bits/stdc++.h>", "using namespace std;" },
      },
    },
  },
}
