{ ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          path = "${../../wallpapers/default.jpg}";
        }
      ];
    };
  };
}
