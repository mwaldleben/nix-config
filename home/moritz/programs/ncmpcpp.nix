{ pkgs, ... }:
{
  programs.ncmpcpp = {
    enable = true;
    bindings = [
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "J";
        command = [
          "select_item"
          "scroll_down"
        ];
      }
      {
        key = "K";
        command = [
          "select_item"
          "scroll_up"
        ];
      }
      {
        key = "l";
        command = [ "next_column" ];
      }
      {
        key = "h";
        command = [ "previous_column" ];
      }
      {
        key = "*";
        command = [ "show_lyrics" ];
      }
    ];
    settings = {
      ncmpcpp_directory = "~/.config/ncmpcpp";
      lyrics_directory = "~/.config/ncmpcpp/lyrics";
      display_volume_level = "no";
      external_editor = "nvim";
      empty_tag_color = "white";
      header_window_color = "black";
      main_window_color = "white";
      statusbar_color = "white";
      song_columns_list_format = "(20)[]{a} (6f)[cyan]{NE} (50)[white]{t|f:Title} (20)[yellow]{b} (7f)[red]{l}";
      progressbar_color = "black:b";
      progressbar_elapsed_color = "black:b";
      progressbar_look = "██▒";
      current_item_prefix = "$(white_black)";
      current_item_suffix = "$(end)";
      current_item_inactive_column_prefix = "$(white)";
      current_item_inactive_column_suffix = "$(end)";
      now_playing_prefix = "$b$(blue)";
      now_playing_suffix = "$/b$(end)";
    };
  };
}
