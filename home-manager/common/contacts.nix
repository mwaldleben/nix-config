{ config, ... }:
{
  accounts.contact = {
    accounts = {
      personal = {
        vdirsyncer = {
          enable = true;
          urlCommand = [
            "cat"
            "${config.sops.secrets.vdirsyncer-url-contact.path}"
          ];
          userNameCommand = [
            "cat"
            "${config.sops.secrets.vdirsyncer-userName.path}"
          ];

        };
        khard.enable = true;
        khal.enable = true;
        local = {
          path = "${config.home.homeDirectory}/.contacts";
          type = "filesystem";
          fileExt = ".vcf";
        };
        remote = {
          type = "carddav";
          passwordCommand = [
            "pass"
            "show"
            "caldav"
          ];
        };
      };
    };
  };

  sops.secrets.vdirsyncer-url-contact = {
    sopsFile = ../../hosts/nixos/thinkpad/secrets.yaml;
  };
  sops.secrets.vdirsyncer-userName = {
    sopsFile = ../../hosts/nixos/thinkpad/secrets.yaml;
  };
}
