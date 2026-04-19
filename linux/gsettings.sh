#!/usr/bin/env bash

# Icons on the desktop <- Disabled
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding show-trash false

# Desktop workspaces
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1

# Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.7
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#e95420'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#e95420'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'do-nothing'

# Favorite apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'slack_slack.desktop', 'telegram-desktop_telegram-desktop.desktop', 'brave-browser.desktop', 'kitty.desktop', 'jetbrains-toolbox.desktop']"

# Date in the top bar <- Activated
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Paste by clicking on the mouse's central button <- Disabled
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# Action when pressing in the central part of a window <- None
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'

# Disable ctrl + alt + (left || right)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"

# Diodon keybinding
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Diodon'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Shift>v'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'/usr/bin/diodon'"
