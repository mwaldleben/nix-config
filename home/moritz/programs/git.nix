{ config, ... } :
{
  programs.git = {
    enable = true;
    userEmail = "moritz@waldleben.ch";
    userName = "Moritz Waldleben";
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull.rebase = false;
      user.signing.key = "B5D736799A90EAA5";
      commit.gpgSign = true;
      gpg.program = "${config.programs.gpg.package}/bin/gpg2";
    };
  };
}
