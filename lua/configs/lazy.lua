return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
  opts = function(_, opts)
    opts.highlight = opts.highlight or {}
    opts.highlight.Comment = { fg = "#7272a9" }
  end,
  require("colors").setup {
    alpha = 0.2, -- Adjust the alpha value for transparency
    transparency = false,
    vim.api.nvim_set_hl(0, "Comment", { fg = "#6b6ba9", bg = "NONE", italic = true }), -- Then override
  },
  ui = {
    icons = {
      ft = "  ",
      lazy = " 󰂠 ",
      loaded = "   ",
      not_loaded = "   ",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
