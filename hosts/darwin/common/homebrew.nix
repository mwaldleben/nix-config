{
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    casks = [
      "firefox"
      "ghostty"
    ];
  };
}
