local M = {}

function M.init()
  -- AI Assistant keybindings
  vim.keymap.set('n', '<leader>aa', ':ChatGPT<CR>', { desc = 'Open AI Assistant Chat' })
  vim.keymap.set('n', '<leader>ae', ':ChatGPTEditWithInstruction<CR>', { desc = 'Edit with AI' })
  vim.keymap.set('n', '<leader>ag', ':ChatGPTRun explain_code<CR>', { desc = 'Explain Code' })
  vim.keymap.set('n', '<leader>ar', ':ChatGPTRun refactor<CR>', { desc = 'Refactor Code' })
  vim.keymap.set('n', '<leader>at', ':ChatGPTRun add_tests<CR>', { desc = 'Generate Tests' })
  vim.keymap.set('n', '<leader>ad', ':ChatGPTRun docstring<CR>', { desc = 'Generate Docstring' })
  vim.keymap.set('n', '<leader>af', ':ChatGPTRun fix_bugs<CR>', { desc = 'Fix Bugs' })
  
  -- Code completion keybindings
  vim.keymap.set('n', '<leader>ac', ':Gen<CR>', { desc = 'Generate Code' })
  vim.keymap.set('v', '<leader>ac', ':Gen<CR>', { desc = 'Generate from Selection' })
end

return M 