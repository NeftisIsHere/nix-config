{ config, pkgs, ... }:

{
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
    
    style = ''
  @import url("file:///home/jazz/.cache/wal/colors-waybar.css");

  /* ================= Global ================= */
  * {
    color: @foreground;
    font-family: "Iosevka Nerd Font", Roboto, sans-serif;
    font-size: 13px;
    font-weight: 500;
    border-radius: 0; /* slim + blocky */
  }

  /* ================= Control Center ================= */
  .control-center {
    background: shade(@background, 0.95);
    border: 2px solid @color8;
    border-radius: 0;
    padding: 6px;
    margin: 4px;
  }

  .notification-window {
    background: shade(@background, 0.95);
    border: 2px solid @color8;
    border-radius: 0;
  }

  /* ================= Scrollbars ================= */
  scrollbar,
  scrollbar slider,
  scrollbar trough {
    background: transparent;
    border: none;
    min-width: 2px;
    min-height: 2px;
  }

  /* ================= Widgets ================= */
  .widget-title,
  .widget-volume,
  .widget-backlight,
  .widget-dnd,
  .widget-mpris,
  .notifications {
    background: transparent;
    border-top: 1px solid shade(@background, 1.2);
    padding: 6px 8px;
    margin: 0;
  }
  .control-center *:first-child { border-top: none; }

  /* Title */
  .widget-title label { color: @color5; } /* magenta */
  .widget-title {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 1px;
    padding: 4px 6px;
    border-bottom: 2px solid shade(@background, 1.2);
  }
  .widget-title button {
    background: transparent;
    border: none;
    color: @color1;
    padding: 0 6px;
    border-bottom: 2px solid transparent;
  }
  .widget-title button:hover {
    color: @color3;
    border-bottom: 2px solid @color3;
  }

  /* Sliders */
  scale trough {
    min-height: 6px;
    border-radius: 0;
    background: shade(@background, 1.2);
  }
  scale slider {
    min-width: 10px;
    min-height: 14px;
    border-radius: 0;
    background: @background;
    border: 1px solid @color8;
  }
  scale highlight {
    border-radius: 0;
    background: currentColor;
  }

  /* Volume */
  .widget-volume label { color: @color1; }   /* red */
  .widget-volume scale highlight { background: @color1; }

  /* Backlight */
  .widget-backlight label { color: @color2; } /* green */
  .widget-backlight scale highlight { background: @color2; }

  /* MPRIS */
  .widget-mpris .widget-mpris-title { color: @color3; }    /* yellow */
  .widget-mpris .widget-mpris-subtitle { color: @color8; } /* muted */
  .mpris-art {
    min-width: 48px;
    min-height: 48px;
    border-radius: 0;
  }

  /* DND */
  .widget-dnd label { color: @color4; } /* blue */
  .widget-dnd switch {
    min-height: 14px;
    min-width: 28px;
    background: shade(@background, 1.2);
    border-radius: 0;
  }
  .widget-dnd switch:checked { background: @color4; }
  .widget-dnd switch slider {
    min-width: 10px;
    min-height: 12px;
    background: @background;
    border: 1px solid @color8;
    border-radius: 0;
  }

  /* ================= Notifications ================= */
  .notification {
    background: shade(@background, 0.98);
    border: 1px solid @color5;
    border-radius: 0;
    padding: 8px 10px;
    margin: 6px 0;
    transition: border-color 120ms ease, color 120ms ease;
  }
  .notification:hover { border-color: @color7; }

  .summary { font-weight: 600; font-size: 13px; }
  .time    { font-size: 11px; color: @color8; }
  .body    { font-size: 12px; }

  .notification-group,
  .notification-row,
  .notification-background {
    background: transparent;
    border: none;
    margin: 0;
    padding: 0;
  }

  /* Action buttons */
  .notification-action button {
    background: transparent;
    border: none;
    color: @color3;
    padding: 2px 6px;
    margin: 4px 2px 0 0;
    border-bottom: 2px solid transparent;
  }
  .notification-action button:hover {
    color: @foreground;
    border-bottom: 2px solid @color7;
  }

  /* Notification close button */
  .close-button {
    background: transparent;
    color: @color5;
    border: none;
    padding: 0 4px;
    font-size: 11px;
  }
  .close-button:hover {
    color: @foreground;
    border-bottom: 2px solid @color7;
  }

  /* Group buttons */
  .notification-group-collapse-button,
  .notification-group-close-all-button {
    background: transparent;
    color: @color5;
    padding: 2px 6px;
    margin: 2px;
    border-bottom: 2px solid transparent;
  }
  .notification-group-collapse-button:hover,
  .notification-group-close-all-button:hover {
    color: @foreground;
    border-bottom: 2px solid @color7;
  }

  .empty-state { padding: 12px; }
  .empty-state .text { color: @color8; font-size: 12px; }

  /* ================= Buttons Grid ================= */
  .widget-buttons {
    border-top: 1px solid shade(@background, 1.2);
    padding: 4px;
    margin-top: 4px;
    background: transparent;
  }

  .widget-buttons flowbox flowboxchild button {
    min-width: 28px;
    min-height: 28px;
    margin: 2px;
    border-radius: 0;
    background: transparent;
    color: @color6;
    font-size: 15px;
    border-bottom: 2px solid transparent;
  }
  .widget-buttons flowbox flowboxchild button:hover {
    color: @foreground;
    border-bottom: 2px solid @color7;
  }

  /* keep first 3 cells invisible */
  .widget-buttons flowbox flowboxchild:nth-child(-n+3) button {
    opacity: 0;
    background: transparent;
    border: none;
  }
'';
  
  };
}
