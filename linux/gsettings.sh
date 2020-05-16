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
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'google-chrome.desktop', 'slack_slack.desktop', 'org.gnome.Terminal.desktop', 'telegram-desktop_telegram-desktop.desktop', 'jetbrains-toolbox.desktop']"

# Date in the top bar <- Activated
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Paste by clicking on the mouse's central button <- Disabled
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# Action when pressing in the central part of a window <- None
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'