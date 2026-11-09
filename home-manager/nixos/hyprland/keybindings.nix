{
  config,
  pkgs,
  lib,
  ...
}:
let
  workspaces = lib.range 1 9;
  directions = {
    h = "l";
    l = "r";
    k = "u";
    j = "d";
  };
  resizes = {
    h = {
      x = -30;
      y = 0;
    };
    l = {
      x = 30;
      y = 0;
    };
    k = {
      x = 0;
      y = -30;
    };
    j = {
      x = 0;
      y = 30;
    };
  };

  toLua = lib.generators.toLua { multiline = false; };
  dsp =
    name: args:
    lib.generators.mkLuaInline "hl.dsp.${name}(${lib.optionalString (args != null) (toLua args)})";
  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  mouseBind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
      { mouse = true; }
    ];
  };
  exec = keys: cmd: bind keys (dsp "exec_cmd" cmd);
in
{
  wayland.windowManager.hyprland.settings = {
    bind =
      let
        amixer = "${pkgs.alsa-utils}/bin/amixer";
        brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
        firefox = "${config.programs.firefox.package}/bin/firefox";
        fuzzel = "${config.programs.fuzzel.package}/bin/fuzzel";
        hyprshot = "${pkgs.hyprshot}/bin/hyprshot";
        pactl = "${pkgs.pulseaudio}/bin/pactl";
        hyprlock = "${config.programs.hyprlock.package}/bin/hyprlock";
        pidof = "${pkgs.procps}/bin/pidof";
        lock = "${pidof} hyprlock || ${hyprlock}";
        terminal = "${config.programs.ghostty.package}/bin/ghostty";
        makoctl = "${config.services.mako.package}/bin/makoctl";
        kanshictl = "${config.services.kanshi.package}/bin/kanshictl";
        displayToggle = pkgs.writeShellScript "display-toggle" ''
          if ${kanshictl} status | ${pkgs.gnugrep}/bin/grep -q 'Current profile: both'; then
            ${kanshictl} switch docked
          else
            ${kanshictl} switch both
          fi
        '';
      in
      [
        (mouseBind "SUPER + mouse:272" (dsp "window.drag" null))
        (mouseBind "SUPER + mouse:273" (dsp "window.resize" null))

        (bind "SUPER + q" (dsp "window.close" null))
        (exec "SUPER + SHIFT + q" "${pkgs.hyprshutdown}/bin/hyprshutdown")
        (bind "SUPER + m" (dsp "window.fullscreen" { mode = "fullscreen"; }))

        # terminal
        (exec "SUPER + SHIFT + return" terminal)

        # browser
        (exec "SUPER + w" firefox)

        # launcher
        (exec "SUPER + o" "${fuzzel} --no-icons")

        # screen lock
        (exec "SUPER + backspace" lock)

        # notification manager
        (exec "SUPER + d" "${makoctl} dismiss")

        # volume control
        (exec "SUPER + Up" "${pactl} set-sink-volume @DEFAULT_SINK@ +5%")
        (exec "SUPER + Down" "${pactl} set-sink-volume @DEFAULT_SINK@ -5%")
        (exec "XF86AudioRaiseVolume" "${pactl} set-sink-volume @DEFAULT_SINK@ +5%")
        (exec "XF86AudioLowerVolume" "${pactl} set-sink-volume @DEFAULT_SINK@ -5%")
        (exec "XF86AudioMute" "${pactl} set-sink-mute @DEFAULT_SINK@ toggle")
        (exec "XF86AudioMicMute" "${amixer} -c Generic_1 sset Capture toggle")

        # brightness control
        (exec "XF86MonBrightnessUp" "${brightnessctl} s 5%+")
        (exec "XF86MonBrightnessDown" "${brightnessctl} s 5%-")

        # screenshots
        (exec "Print" "${hyprshot} -m output")
        (exec "SHIFT + Print" "${hyprshot} -m region")

        (exec "SUPER + p" "${displayToggle}")
        (exec "switch:on:Lid Switch" "${kanshictl} switch docked")
      ]
      ++
        # change workspace
        (map (n: bind "SUPER + ${toString n}" (dsp "focus" { workspace = n; })) workspaces)
      ++

        # move window to workspace
        (map (
          n:
          bind "SUPER + SHIFT + ${toString n}" (
            dsp "window.move" {
              workspace = n;
              follow = false;
            }
          )
        ) workspaces)
      ++

        # move focus
        (lib.mapAttrsToList (
          key: direction: bind "SUPER + ${key}" (dsp "focus" { inherit direction; })
        ) directions)
      ++

        # resize window
        (lib.mapAttrsToList (
          key: resize: bind "SUPER + ALT + ${key}" (dsp "window.resize" (resize // { relative = true; }))
        ) resizes)
      ++

        # swap windows
        (lib.mapAttrsToList (
          key: direction: bind "SUPER + SHIFT + ${key}" (dsp "window.swap" { inherit direction; })
        ) directions);
  };
}
