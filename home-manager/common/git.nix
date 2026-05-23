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
        signing.key = "B5D736799A90EAA5";
      };
      commit.gpgSign = true;
      gpg.program = "${pkgs.gnupg}/bin/gpg2";
    };
  };
}
