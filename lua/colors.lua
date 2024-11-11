local M = {}

M.setup = function(opts)
  local alpha = opts.alpha or 0.8
  -- Define background and foreground colors with transparency
  local bg_color = "#1e1e1e" -- Replace with your preferred base color for transparency
  local fg_color = "#d4d4d4" -- Replace with a suitable foreground color
  -- Convert alpha to hexadecimal
  local alpha_hex = string.format("%02x", math.floor(alpha * 255))

  local colors = {
    bg = bg_color .. alpha_hex,
    fg = fg_color,
    normal = bg_color .. alpha_hex,
    border = bg_color .. alpha_hex,
    tabline = {
      bg = bg_color .. alpha_hex,
      fg = fg_color,
      active = bg_color .. alpha_hex,
      inactive = bg_color .. alpha_hex,
    },
    cursorline = {
      bg = bg_color .. alpha_hex,
      fg = fg_color,
    },
    -- Add other color settings as needed
  }

  -- Set these global variables if required by your setup
  vim.g.nvchad_transparent_background = true
  vim.g.nvchad_color_override = colors
end

return M
