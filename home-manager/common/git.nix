{ pkgs, ... }:
{
  programs.gpg.enable = true; # needed for commit signing

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      pull.rebase = false;
      user = {
        email = "moritz@waldleben.ch";
        name = "Moritz Waldleben";
        signingKey = "9EF57D12FE49D907!";
      };
      commit.gpgSign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg2";
    };
  };
}
