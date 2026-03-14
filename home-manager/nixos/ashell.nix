{ ... }:
{
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    settings = {
      modules = {
        left = [ "Workspaces" ];
        center = [ "Clock" ];
        right = [
          "MediaPlayer"
          [
            "Tray"
            "Settings"
          ]
        ];
      };
      workspaces = {
        enable_workspace_filling = true;
        max_workspaces = 5;
      };
      appearance = {
        style = "Islands";
        scale_factor = 1;
      };
      media_player = {
        max_title_length = 40;
      };
    };
  };
}
