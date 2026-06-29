{ pkgs, ... }:
let
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  date = "${pkgs.coreutils}/bin/date";
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
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$accent";
        inner_color = "$surface0";
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
          color = "$text";
          font_size = "120";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] LC_TIME=C ${date} '+%A, %d %B %Y'";
          color = "$text";
          font_size = 25;
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:5000] echo \"󰎈  $(${playerctl} metadata xesam:title 2>/dev/null)\"";
          color = "$text";
          font_size = 20;
          position = "-50, -50";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:5000] ${playerctl} metadata xesam:artist 2>/dev/null";
          color = "$subtext0";
          font_size = 16;
          position = "-50, -80";
          halign = "right";
          valign = "top";
        }
      ];
    };
  };
}
