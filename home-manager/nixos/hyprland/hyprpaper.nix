{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = "${../../wallpapers/default.jpg}";
          fit_mode = "cover";
        }
      ];
    };
  };
}
