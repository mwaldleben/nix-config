{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      interval = [
        {
          Hour = 3;
          Minute = 15;
          Weekday = 7;
        }
      ];
      options = "--delete-older-than 7d";
    };
  };
}
