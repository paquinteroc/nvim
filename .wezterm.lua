local wezterm = require("wezterm")
local act = wezterm.action

return {
  -- default_prog = {'wsl.exe'},
  default_cwd = "~",
  font = wezterm.font("JetBrains Mono"),
  font_size = 11.0,
  color_scheme = "Dracula",
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  -- Clipboard settings
  enable_wayland = false, -- Set to true if you're using Wayland

  enable_csi_u_key_encoding = false,
  -- Custom key bindings
  keys = {
    -- Set Ctrl+V to paste from clipboard
    { key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

    -- Since we're overriding Ctrl+V, let's set Ctrl+Shift+V to the default "visual" mode
    { key = "v", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
  },

  mouse_bindings = {
    -- Make sure right-click paste is enabled
    {
      event = { Down = { streak = 1, button = "Right" } },
      mods = "NONE",
      action = act.PasteFrom("Clipboard"),
    },
  },

  -- Disable close confirmation
  window_close_confirmation = "NeverPrompt",
}
