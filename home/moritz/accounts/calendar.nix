{ config, ... }:
let pass = "${config.programs.password-store.package}/bin/pass";
in {
  accounts.calendar = {
    accounts = {
      personal = {
        primary = true;
        vdirsyncer = {
          enable = true;
          urlCommand =
            [ "cat" "${config.sops.secrets.vdirsyncer-url-calendar.path}" ];
          userNameCommand =
            [ "cat" "${config.sops.secrets.vdirsyncer-userName.path}" ];
        };
        khal.enable = true;
        local = {
          path = "~/.calendar";
          type = "filesystem";
          fileExt = ".ics";
        };
        remote = {
          type = "caldav";
          passwordCommand = [ "pass" "show" "caldav" ];
        };
      };
    };
  };

  programs.vdirsyncer = { enable = true; };

  sops.secrets.vdirsyncer-url-calendar = {
    sopsFile = ../../../hosts/thinkpad/secrets.yaml;
  };
  sops.secrets.vdirsyncer-userName = {
    sopsFile = ../../../hosts/thinkpad/secrets.yaml;
  };
}
