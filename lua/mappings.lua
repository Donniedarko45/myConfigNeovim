require "nvchad.mappings"

local map = vim.keymap.set

-- General mappings
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "TMUX window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "TMUX window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "TMUX window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "TMUX window up" })

-- Use j and k as gj and gk
map("n", "j", "gj", { desc = "Move down by visual line" })
map("n", "k", "gk", { desc = "Move up by visual line" })
map("v", "j", "gj", { desc = "Move down by visual line" })
map("v", "k", "gk", { desc = "Move up by visual line" })

-- DAP mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = " DAP Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DAP Open debugging sidebar" })

-- DAP Go mappings
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "DAP Debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "DAP Debug last go test" })

-- Gopher mappings
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Gopher Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Gopher Add yaml struct tags" })

-- Persistence mappings
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Persistence Restore Session" })
map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end, { desc = "Persistence Restore Last Session" })
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Persistence Don't Save Current Session" })

-- LSP mappings

map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP Floating diagnostic" })

-- gitsigns mappings
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns Git preview hunk" })
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns Preview hunk" })
map("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>", { desc = "Gitsigns Blame line" })
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns Toggle line blame" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Gitsigns Diff this" })
map("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Gitsigns Next hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Gitsigns Previous hunk" })

-- leetcode mappings
map("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "LeetCode Run tests" })
map("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "LeetCode Submit solution" })

--color picker

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- Snacks.nvim mappings
map("n", "<leader>un", function()
  require("snacks").notifier.hide()
end, { desc = "Dismiss All Notifications" })
map("n", "<leader>bd", function()
  require("snacks").bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>gb", function()
  require("snacks").git.blame_line()
end, { desc = "Git Blame Line" })
map("n", "<leader>gB", function()
  require("snacks").gitbrowse()
end, { desc = "Git Browse" })
map("n", "<leader>cR", function()
  require("snacks").rename.rename_file()
end, { desc = "Rename File" })
map("n", "<leader>tt", function()
  require("snacks").terminal()
end, { desc = "Toggle Terminal" })
map("n", "<C-_>", function()
  require("snacks").terminal()
end, { desc = "Toggle Terminal (alias)" })
map("n", "]]", function()
  require("snacks").words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map("n", "[[", function()
  require("snacks").words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })
map("n", "<leader>N", function()
  require("snacks").win {
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  }
end, { desc = "Neovim News" })

-- vscode format i.e json files
vim.g.vscode_snippets_path = "your snippets path"

-- snipmate format
vim.g.snipmate_snippets_path = "your snippets path"

-- lua format
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"
