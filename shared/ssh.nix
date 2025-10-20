{ config, ... }:

{
  config = {
      programs.ssh = {
        enable = true;
        addKeysToAgent = "yes";
    };
  };
}
