-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font_size = 14.0

config.default_prog = { "pwsh" }

config.default_cursor_style = "BlinkingUnderline"

config.animation_fps = 144

config.window_background_opacity = 0.75

config.keys = {
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Vertical split (same as tmux `Ctrl + b "`)
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Pane navigation bindings to mimic tmux style `Ctrl + b` + arrow keys
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Close current pane (similar to tmux `Ctrl + b x`)
	{
		key = "x",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "C",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateCopyMode,
	},
}

-- and finally, return the configuration to wezterm
return config
