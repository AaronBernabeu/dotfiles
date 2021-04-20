#!/usr/bin/env bash

# Icons on the desktop <- Disabled
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

# Dock
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Favorite apps
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'slack_slack.desktop', 'telegram-desktop_telegram-desktop.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop', 'jetbrains-toolbox.desktop']"

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
