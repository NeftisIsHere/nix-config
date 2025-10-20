{ pkgs, ... }:
{
  programs.fastfetch = {
    package = pkgs.fastfetch;
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 1;
          top = 1;
        };
      };

      display = {
        separator = " ";
      };

      modules = [
             {
            "key" = "╭────────────╮";
            "type" = "custom";
        }
        {
            "key" = "│ {#31} user     {#keys}│";
            "type" = "title";
            "format" = "{user-name}";
        }
        {
            "key" = "│ {#32}󰇅 hostname {#keys}│";
            "type" = "title";
            "format" = "{host-name}";
        }
        {
            "key" = "│ {#33}󰅐 uptime   {#keys}│";
            "type" = "uptime";
        }
        {
            "key" = "│ {#34}{icon} distro   {#keys}│";
            "type"= "os";
        }
        {
            "key" = "│ {#35} kernel   {#keys}│";
            "type" = "kernel";
        }
        {
            "key" = "│ {#36}󰏖 packages {#keys}│";
            "type" = "packages";
        }
        {
            "key" = "│ {#31}󰇄 desktop  {#keys}│";
            "type" = "de";
        }
        {
            "key" = "│ {#32} term     {#keys}│";
            "type" = "terminal";
        }
        {
            "key" = "│ {#33} shell    {#keys}│";
            "type" = "shell";
        }
        {
            "key" = "│ {#34}󰍛 cpu      {#keys}│";
            "type" = "cpu";
            "showPeCoreCount" = true;
        }
        {
            "key" = "│ {#35} ram      {#keys}│";
            "type" = "memory";
        }
        {
            "key" = "│ {#31}󰉉 root     {#keys}│";
            "type" = "disk";
            "folders" = "/";
        }
        {
            "key" = "│ {#32}󰉉 data     {#keys}│";
            "type" = "disk";
            "folders" = "/mnt/data";
        }
        {
            "key" = "│ {#33}󰉉 games    {#keys}│";
            "type" = "disk";
            "folders" = "/home/jazz/games";
        }
        {
            "key" = "├────────────┤";
            "type" = "custom";
        }
        {
            "key" = "│ {#39} colors   {#keys}│";
            "type" = "colors";
            "symbol" = "circle";
        }
        {
            "key" = "╰────────────╯";
            "type" = "custom";
        }
      ];
    };
  };
}
