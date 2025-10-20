_: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "~/.cache/wal/colors-foot.ini";
        font = "Fira Code Nerd Font Mono:size=11";
      };
      bell.system = "no";

      cursor = {
        style = "beam";
        blink = "yes";
      };
      colors = {
        alpha = 0.85;
      };
    };
  };
}
