{ config, ... }:
let pass = "${config.programs.password-store.package}/bin/pass";
in {
  accounts.contact = {
    accounts = {
      personal = {
        vdirsyncer.enable = true;
        khard.enable = true;
        local.path = "~/contacts";
        remote = {
          type = "carddav";
          url = "https://sync.infomaniak.com/";
          address = "moritz@waldleben.ch";
          userName = "moritz@waldleben.ch";
          passwordCommand = "${pass} show infomaniak.com/${userName}";
        };
      };
    };
  };
}
