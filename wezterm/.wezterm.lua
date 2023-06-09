-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This table will hold the configuration.
local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.default_prog = { "pwsh.exe" }
config.window_frame = {
    active_titlebar_bg = "#13131e",
    inactive_titlebar_bg = "#13131e",
}
config.font = wezterm.font("FiraCode NFM", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.color_scheme = 'Catppuccin Mocha'
config.colors = {
    tab_bar = {
        active_tab = {
            bg_color = "#1e1e2e",
            fg_color = "#cdd6f4"
        },
        inactive_tab = {
            bg_color = "#13131e",
            fg_color = "#cdd6f4"
        },
        new_tab = {
            bg_color = "#13131e",
            fg_color = "#cdd6f4"
        }
    }
}
config.keys = {}

for i = 1, 8 do
    -- CTRL+ALT + number to move to that position
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'CTRL|ALT',
        action = wezterm.action.MoveTab(i - 1),
    })
end

return config
