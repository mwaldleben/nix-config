{
  config,
  lib,
  pkgs,
  ...
}:
let
  # cattpuccin nix does not support ashell
  palette =
    (lib.importJSON "${config.catppuccin.sources.palette}/palette.json")
    .${config.catppuccin.flavor}.colors;
  color = name: palette.${name}.hex;
  hyprshutdown =
    postCmd:
    "${pkgs.systemd}/bin/systemd-run --user --collect --property=KillMode=process ${pkgs.hyprshutdown}/bin/hyprshutdown --no-fork"
    + lib.optionalString (postCmd != null) " --post-cmd '${pkgs.systemd}/bin/systemctl ${postCmd}'";
in
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
        scale_factor = 1;
        bar = {
          surface = "solid";
          radius = "md";
          margin = [
            "xs"
            "xs"
            "none"
            "xs"
          ];
        };
        background_color = {
          base = color "base";
          weak = color "surface0";
          strong = color "surface1";
        };
        primary_color = {
          base = color config.catppuccin.accent;
          text = color "base";
        };
        success_color = color "green";
        warning_color = color "yellow";
        danger_color = color "red";
        text_color = color "text";
      };
      media_player = {
        max_text_length = 40;
      };
      settings = {
        logout_cmd = hyprshutdown null;
        shutdown_cmd = hyprshutdown "poweroff";
        reboot_cmd = hyprshutdown "reboot";
      };
    };
  };

  systemd.user.services.ashell.Unit = {
    PartOf = [ "graphical-session.target" ];
    ConditionEnvironment = "WAYLAND_DISPLAY";
  };
}
