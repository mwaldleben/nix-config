{
  programs.git = {
    enable = true;
    userEmail = "moritz@waldleben.ch";
    userName = "Moritz Waldleben";
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull.rebase = false;
    };
  };
}
