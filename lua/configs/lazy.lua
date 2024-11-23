return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
  require("colors").setup {
    alpha = 0.2, -- Adjust the alpha value for transparency
    transparency = true,
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
