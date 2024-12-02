local wezterm = require("wezterm")

return {
  font_size = 19.3,
  font = wezterm.font("UbuntuMono Nerd Font"),
  term = "xterm-256color",
  animation_fps = 60,
  max_fps = 60,
  color_scheme = "Gruvbox Dark",
  window_decorations = "RESIZE",
  cursor_blink_rate = 500,
  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
	active_titlebar_bg = "#343434",
	inactive_titlebar_bg = "#5c5c5c",
  window_padding = {
   left = 0,
   right = 0,
   top = 0,
   bottom = 0,
 },
  colors = {
    background = "#282828",
    foreground = "#fbf1c7",

	--         Black      Maroon     Green      Olive      Navy       Purple     Teal       Silver
	ansi = { "#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },

	--             Grey       Red        Lime      Yellow      Blue      Fuchsia    Squa      White
	brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },

		}
}