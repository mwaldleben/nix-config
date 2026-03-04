{ config, ... }:
let
  pass = "${config.programs.password-store.package}/bin/pass";
in
{
  accounts.calendar = {
    accounts = {
      personal = {
        primary = true;
        vdirsyncer = {
          enable = true;
          urlCommand = [
            "cat"
            "${config.sops.secrets.vdirsyncer-url-calendar-personal.path}"
          ];
          userNameCommand = [
            "cat"
            "${config.sops.secrets.vdirsyncer-userName.path}"
          ];
        };
        khal.enable = true;
        local = {
          path = "/home/${config.home.username}/.calendars/personal";
          type = "filesystem";
          fileExt = ".ics";
        };
        remote = {
          type = "caldav";
          passwordCommand = [
            "pass"
            "show"
            "caldav"
          ];
        };
      };
      holidays = {
        vdirsyncer = {
          enable = true;
          urlCommand = [
            "cat"
            "${config.sops.secrets.vdirsyncer-url-calendar-holidays.path}"
          ];
          userNameCommand = [
            "cat"
            "${config.sops.secrets.vdirsyncer-userName.path}"
          ];
        };
        khal = {
          enable = true;
          readOnly = true;
        };
        local = {
          path = "~/.calendars/holidays";
          type = "filesystem";
          fileExt = ".ics";
        };
        remote = {
          type = "caldav";
          passwordCommand = [
            "pass"
            "show"
            "caldav"
          ];
        };
      };
    };
  };

  programs.vdirsyncer = {
    enable = true;
  };

  sops.secrets.vdirsyncer-userName = {
    sopsFile = ../../hosts/nixos/thinkpad/secrets.yaml;
  };
  sops.secrets.vdirsyncer-url-calendar-personal = {
    sopsFile = ../../hosts/nixos/thinkpad/secrets.yaml;
  };
  sops.secrets.vdirsyncer-url-calendar-holidays = {
    sopsFile = ../../hosts/nixos/thinkpad/secrets.yaml;
  };
}
