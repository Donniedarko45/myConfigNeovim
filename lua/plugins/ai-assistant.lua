return {
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "mistral", -- The default model to use
      host = "localhost", -- The host running the Ollama server
      port = "11434", -- The port number for the Ollama server
      display_mode = "float", -- The display mode. Can be "float" or "split"
      show_prompt = false, -- Shows the Prompt submitted to Ollama
      show_model = false, -- Displays which model you are using at the beginning of your chat session
      no_auto_close = false, -- Never closes the window automatically
      init = function() -- Called when the plugin is initialized
        -- You can use this to set custom keybindings or other initialization steps
      end,
      -- Function to validate whether the Mistral API key is available
      validate_api_key = function()
        local api_key = os.getenv("MISTRAL_API_KEY")
        if not api_key then
          vim.notify("MISTRAL_API_KEY environment variable not found!", vim.log.levels.ERROR)
          return false
        end
        return true
      end,
    }
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "echo $MISTRAL_API_KEY",
        yank_register = "+",
        edit_with_instructions = {
          diff = false,
          keymaps = {
            close = "<C-c>",
            accept = "<C-y>",
            toggle_diff = "<C-d>",
            toggle_settings = "<C-o>",
            cycle_windows = "<Tab>",
            use_output_as_input = "<C-i>",
          },
        },
        chat = {
          welcome_message = "Welcome to Neovim AI Assistant! How can I help you?",
          loading_text = "Loading...",
          question_sign = "🤔",
          answer_sign = "🤖",
          max_line_length = 120,
          sessions_window = {
            border = {
              style = "rounded",
              text = {
                top = " Sessions ",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
          },
        },
        popup_layout = {
          default = "center",
          center = {
            width = "80%",
            height = "80%",
          },
        },
        popup_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " AI Assistant ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = "1",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        system_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " SYSTEM ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = "2",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
      })
    end,
  },
} 