local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Windows size ---------------------------------------------------------------

config.native_macos_fullscreen_mode = true

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

-- Aesthetic ------------------------------------------------------------------

config.color_scheme = "Ocean (base16)"
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 13

-- Key Binding ----------------------------------------------------------------

-- timeout_milliseconds defaults to 500 and can be omitted
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 500 }
config.keys = {
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.SpawnWindow,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.PaneSelect,
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
}

return config
