local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_background_opacity = 0.8
config.macos_window_background_blur = 15
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.keys = {
{
	key = "c",
	mods = "CTRL",
	action = wezterm.action_callback(function(window, pane)
	local has_selection = window:get_selection_text_for_pane(pane) ~= ''

	if has_selection then 
	  window:perform_action(
	    wezterm.action.CopyTo('ClipboardAndPrimarySelection'),
	    pane
	   )
	
	  window:perform_action(
	    wezterm.action.ClearSelection,
	    pane
	   )
	else
	  window:perform_action(
	    wezterm.action.SendKey{
		key = 'c',
		mods = 'CTRL',
	    },
	    pane
	)
	end
	end),
},

{
	key = "v",
	mods = "CTRL",
	action = wezterm.action.PasteFrom("Clipboard"),
},
}

return config
