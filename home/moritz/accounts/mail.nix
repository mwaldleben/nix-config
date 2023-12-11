{ config, ... }:
let pass = "${config.programs.password-store.package}/bin/pass";
in {
  accounts.email = {
    maildirBasePath = "mail";
    accounts = {
      personal = rec {
        primary = true;
        maildir.path = ".";
        address = "moritz@waldleben.ch";
        realName = "Moritz Waldleben";
        userName = address;
        passwordCommand = "${pass} show infomaniak.com/${address}";
        smtp = {
          host = "mail.infomaniak.ch";
          port = 465;
          tls.enable = true;
        };
        imap = {
          host = "mail.infomaniak.ch";
          port = 993;
          tls.enable = true;
        };
        mbsync = {
          enable = true;
          create = "maildir";
          expunge = "both";
        };
        msmtp.enable = true;
        # folders = {
        #   inbox = "inbox";
        #   drafts = "drafts";
        #   sent = "sent";
        #   trash = "trash";
        # };
        neomutt = {
          enable = true;
          extraMailboxes = [ "Drafts" "Sent" ];
        };
      };
    };
  };
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
}
