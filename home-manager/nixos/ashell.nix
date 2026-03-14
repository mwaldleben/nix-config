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
          [
            "Tray"
            "Settings"
          ]
        ];
      };
      workspaces = {
        enable_workspace_filling = false;
      };
      appearance = {
        style = "Islands";
        scale_factor = 1.1;
      };
    };
  };
}
