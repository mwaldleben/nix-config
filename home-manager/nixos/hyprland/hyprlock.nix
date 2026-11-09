{ pkgs, ... }:
let
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  date = "${pkgs.coreutils}/bin/date";
  nowPlaying = pkgs.writeShellScript "now-playing" ''
    value=$(${playerctl} -a metadata --format "{{status}}"$'\t'"{{$1}}" 2>/dev/null \
      | ${pkgs.gnugrep}/bin/grep -m1 '^Playing' \
      | ${pkgs.coreutils}/bin/cut -f2)
    [ -n "$value" ] && echo "$2$value"
  '';
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      background = {
        monitor = "";
        path = "${../../wallpapers/default.jpg}";
      };
      input-field = {
        monitor = "";
        size = "300, 50";
        rounding = 8;
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$accent";
        inner_color = "$base";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = "<span foreground='##$textAlpha'><i>󰌾 Hello </i><span foreground='##$accentAlpha'>$USER</span></span>";
        hide_input = false;
        check_color = "$accent";
        fail_color = "$red";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "$yellow";
        position = "0, -300";
        halign = "center";
        valign = "center";
      };
      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "$accent";
          font_size = "120";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] LC_TIME=C ${date} '+%A, %d %B %Y'";
          color = "$accent";
          font_size = 25;
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:5000] ${nowPlaying} title '󰎈  '";
          color = "$accent";
          font_size = 20;
          position = "-50, -50";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:5000] ${nowPlaying} artist";
          color = "$accent";
          font_size = 16;
          position = "-50, -80";
          halign = "right";
          valign = "top";
        }
      ];
    };
  };
}
