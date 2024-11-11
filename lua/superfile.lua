-- Superfile WSL integration for Neovim with theming
-- Save this as ~/.config/nvim/lua/superfile.lua

local M = {}

function M.setup()
  -- Function to open Superfile in a themed terminal buffer
  function _G.open_superfile()
    -- Open a vertical split on the left side
    vim.cmd('leftabove vnew')
    -- Set the width of the Superfile window
    vim.cmd('vertical resize 40')
    -- Create terminal with Superfile
    vim.cmd('terminal spf')
    -- Set buffer name
    vim.cmd('file Superfile')
    -- Apply buffer-specific settings
    local buf = vim.api.nvim_get_current_buf()

    -- Apply terminal specific highlights to match your theme
    vim.cmd([[
      setlocal winhighlight=Normal:NormalFloat
      setlocal sidescrolloff=0
      setlocal signcolumn=no
    ]])
    -- Key mappings for the Superfile buffer
    vim.api.nvim_buf_set_keymap(buf, 't', '<Esc>', '<C-\\><C-n>', { noremap = true })
    vim.api.nvim_buf_set_keymap(buf, 't', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true })
    -- Auto-commands for the Superfile buffer
    vim.api.nvim_create_autocmd("TermEnter", {
      buffer = buf,
      callback = function()
        vim.cmd('startinsert')
      end
    })
    -- Make the buffer persistent
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function()
        vim.cmd('bdelete!')
      end
    })
    -- Start in insert mode
    vim.cmd('startinsert')
  end

  -- Create command to toggle Superfile
  vim.api.nvim_create_user_command('Superfile', function()
    -- Check if Superfile is already open
    local wins = vim.api.nvim_list_wins()
    local superfile_open = false
    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match("Superfile$") then
        superfile_open = true
        vim.api.nvim_win_close(win, true)
        break
      end
    end
    if not superfile_open then
      vim.cmd('lua open_superfile()')
    end
  end, {})

  -- Add key mapping to toggle Superfile
  vim.keymap.set('n', '<leader>sf', ':Superfile<CR>', { noremap = true, silent = true })
  -- Auto-open Superfile when Neovim starts
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Delay the opening slightly to ensure proper initialization
      vim.defer_fn(function()
        vim.cmd('Superfile')
      end, 100)
    end
  })
end

return M
