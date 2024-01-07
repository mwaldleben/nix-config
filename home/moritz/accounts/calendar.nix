{ config, ... }:
let pass = "${config.programs.password-store.package}/bin/pass";
in {
  accounts.calendar = {
    accounts = {
      personal = {
        primary = true;
        vdirsyncer = { enable = true; };
        khal.enable = true;
        local = {
          path = "~/.calendar";
          type = "filesystem";
          fileExt = ".ics";
        };
        remote = {
          type = "caldav";
          # TODO: waiting for https://github.com/nix-community/home-manager/issues/4399 to keep url secret
          # url = "";
          # userName = "";
          # passwordCommand = [ ];
        };
      };
    };
  };
  programs.vdirsyncer = { enable = true; };
}
