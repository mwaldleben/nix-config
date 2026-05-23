{ ... }:
{
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    settings = {
      modules = {
        left = [ "Workspaces" ];
        center = [ "Tempo" ];
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
        # cattpuccin nix does not support ashell
        background_color = {
          base = "#303446";
        };
        primary_color = {
          base = "#8caaee";
        };
        secondary_color = {
          base = "#626880";
        };
        success_color = {
          base = "#a6d189";
        };
        danger_color = {
          base = "#e78284";
        };
        text_color = "#c6d0f5";
      };
      media_player = {
        max_title_length = 40;
      };
    };
  };
}
