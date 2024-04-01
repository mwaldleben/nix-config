{ config, ... }:
let pass = "${config.programs.password-store.package}/bin/pass";
in {
  accounts.contact = {
    accounts = {
      personal = {
        vdirsyncer = {
          enable = true;
          urlCommand =
            [ "cat" "${config.sops.secrets.vdirsyncer-url-contact.path}" ];
          userNameCommand =
            [ "cat" "${config.sops.secrets.vdirsyncer-userName.path}" ];

        };
        khard.enable = true;
        khal.enable = true;
        local = {
          path = "~/.contacts";
          type = "filesystem";
          fileExt = ".vcf";
        };
        remote = {
          type = "carddav";
          passwordCommand = [ "pass" "show" "caldav" ];
        };
      };
    };
  };

  sops.secrets.vdirsyncer-url-contact = {
    sopsFile = ../../../hosts/thinkpad/secrets.yaml;
  };
  sops.secrets.vdirsyncer-userName = {
    sopsFile = ../../../hosts/thinkpad/secrets.yaml;
  };
}
