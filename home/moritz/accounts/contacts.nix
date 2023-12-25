{ config, ... }:
let pass = "${config.programs.password-store.package}/bin/pass";
in {
  accounts.contact = {
    accounts = {
      personal = {
        vdirsyncer = { enable = true; };
        khard.enable = true;
        khal.enable = true;
        local = {
          path = "~/contacts";
          type = "filesystem";
          fileExt = ".vcf";
        };
        remote = {
          type = "carddav";
          # TODO: waiting for https://github.com/nix-community/home-manager/issues/4399 to keep url secret
          # url = "";
          # userName = "";
          # passwordCommand = [ ];
        };
      };
    };
  };
}
