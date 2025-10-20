{ config, pkgs, ... }:

{
  xdg.configFile."swaync/style.css".source = ./style.css;
  services.swaync = {
    enable = true;

    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      cssPriority = "user";
      "ignore-gtk-theme" = true;

      layer = "overlay";
      "control-center-layer" = "top";
      "layer-shell" = true;

      "control-center-width" = 370;
      "control-center-height" = 770;
      "control-center-margin-top" = 10;
      "control-center-margin-bottom" = 10;
      "control-center-margin-right" = 10;
      "control-center-margin-left" = 0;

      "notification-window-width" = 380;
      "notification-body-image-height" = 200;
      "notification-body-image-width" = 200;

      timeout = 8;
      "timeout-low" = 6;
      "timeout-critical" = 0;

      "fit-to-screen" = true;
      "keyboard-shortcuts" = true;
      "image-visibility" = "when-available";
      "transition-time" = 200;
      "hide-on-clear" = false;
      "hide-on-action" = true;
      "script-fail-notify" = true;

      widgets = [
        "buttons-grid"
        "volume"
        "backlight"
        "mpris"
        "dnd"
        "title"
        "notifications"
      ];

      "widget-config" = {
        title = {
          text = "Notification Center";
          "clear-all-button" = true;
          "button-text" = "󰆴";
        };
        volume = {
          label = "󰕾 ";
          "expand-button-label" = " ";
          "collapse-button-label" = " ";
          "show-per-app" = true;
          "show-per-app-icon" = false;
          "show-per-app-label" = true;
        };
        backlight = {
          label = "󰃟 ";
          device = "amdgpu_bl1";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        mpris = {
          "show-album-art" = "when-available";
        };
        notifications = {
          vexpand = true;
        };
        "buttons-grid" = {
          "buttons-per-row" = 4;
          actions = [
            {
              label = "󰖩";
              command = "/home/jazz/.dotfiles/.config/swaync/scripts/network-config.sh";
              type = "normal";
            }
            {
              label = "";
              command = "/home/jazz/.dotfiles/.config/swaync/scripts/bluetooth-config.sh";
              type = "normal";
            }
            {
              label = "󰈔";
              command = "dolphin";
              type = "normal";
            }
            {
              label = "󰍃";
              command = "wlogout";
              type = "normal";
            }
          ];
        };
      };
    };
  };
}
