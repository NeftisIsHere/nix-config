{
  pkgs,
  ...
}:
{
  xdg.configFile."waybar/style.css".source = ./style.css;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "niri.service";
    settings = [
      {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 0;
        modules-left = [
          "niri/workspaces"
          "tray"
        ];
        modules-center = [
          "niri/window"
        ];
        modules-right = [
          "niri/language"
          "idle_inhibitor"
          "wireplumber"
          "backlight"
          "battery"
          "clock"
          "custom/notification"
        ];

        "tray" = {
          spacing = 20;
          icon-size = 16;
          show-passive-items = true;
        };
        "niri/window" = {
          "ellipsize" = "end";
        };

        "clock" = {
          format = ''  {:L%H:%M}'';
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };
        "wireplumber" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon} ";
          format-bluetooth-muted = "󰝟 {icon} ";
          format-muted = "󰍭 {format_source} ";
          format-source = " {volume}% ";
          format-source-muted = " ";
          format-icons = {
            headphone = "󰋋";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [
              ""
              " "
              " "
            ];
          };
          on-click = "sleep 0.1 && pwvucontrol";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = true;
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰒲";
          };
          tooltip-format-activated = "Idle inhibit: ON";
          tooltip-format-deactivated = "Idle inhibit: OFF";
          start-activated = false;
        };
        "custom/notification" ={
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      }
    ];
  };
}
