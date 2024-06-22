{ config, pkgs, ... }:
let
  nvim = "${pkgs.neovim}/bin/nvim";
  mbsync = "${config.programs.mbsync.package}/bin/mbsync";
  urlscan = "${pkgs.urlscan}/bin/urlscan";
in
{
  programs.neomutt = {
    enable = true;
    vimKeys = true;
    sort = "reverse-date-received";
    checkStatsInterval = 60;
    sidebar = {
      enable = true;
      width = 30;
    };
    settings = {
      mailcap_path = "${config.home.homeDirectory}/.config/neomutt/mailcap";
      confirm_append = "no";
      confirm_create = "no";
      fast_reply = "yes";
      fcc_attach = "yes";
      forward_quote = "yes";
      status_on_top = "yes";
      include = "yes";
      index_format = ''"%4C %Z %{%d %b %H:%M} %-30.30L (%<l?%4l&%4c>) %s"'';
      mark_old = "yes";
      markers = "no";
      mime_forward = "yes";
      query_command = ''"khard email --parsable '%s'"'';
      quit = "ask-yes";
      reverse_name = "yes";
      sort = "last-date";
      sort_aux = "date";
      sleep_time = "0";
      text_flowed = "yes";
      use_threads = "threads";
      wait_key = "no";

    };
    binds = [
      {
        action = "display-message";
        key = "l";
        map = [ "index" ];
      }
      {
        action = "view-mailcap";
        key = "l";
        map = [ "attach" ];
      }
      {
        action = "view-mailcap";
        key = "<return>";
        map = [ "attach" ];
      }
      {
        action = "delete-message";
        key = "D";
        map = [ "index" ];
      }
      {
        action = "undelete-message";
        key = "U";
        map = [ "index" ];
      }
      {
        action = "limit";
        key = "L";
        map = [ "index" ];
      }
      {
        action = "sync-mailbox";
        key = "S";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "complete-query";
        key = "<Tab>";
        map = [ "editor" ];
      }
      {
        action = "view-raw-message";
        key = "H";
        map = [
          "index"
          "pager"
        ];
      }
    ];
    macros = [
      {
        action = "<sidebar-next><sidebar-open>";
        key = "\\cj";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "<sidebar-prev><sidebar-open>";
        key = "\\ck";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "<sidebar-toggle-visible>";
        key = "E";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "<shell-escape>${mbsync} -a<enter>";
        key = "O";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "<pipe-message>${urlscan}<enter>";
        key = "F";
        map = [
          "index"
          "pager"
        ];
      }
      {
        action = "<pipe-entry>${urlscan}<enter>";
        key = "F";
        map = [
          "attach"
          "compose"
        ];
      }
      {
        action = "<pipe-message>khard add-email<enter>";
        key = "A";
        map = [
          "index"
          "pager"
        ];
      }
    ];
    extraConfig = ''
      # binding overrides (changes for default vim bindings of home-manager)
      unbind i
      bind index h noop
      bind pager,attach h exit 
      bind index j next-entry
      bind index k previous-entry
      bind index <return> display-message

      # index colors
      color index_number color4 default
      color index_author color3 default '.*'
      color index_subject color6 default '.*'

      # addapted from https://github.com/catppuccin/neomutt
      color normal		  default default         # Text is "Text"
      color index		    color2 default ~N       # New Messages are Green
      color index		    color1 default ~F       # Flagged messages are Red
      color index		    color13 default ~T      # Tagged Messages are Red
      color index		    color1 default ~D       # Messages to delete are Red
      color attachment	color5 default          # Attachments are Pink
      color signature	  color8 default          # Signatures are Surface 2
      color search		  color4 default          # Highlighted results are Blue

      color indicator		default color8          # currently highlighted message Surface 2=Background Text=Foreground
      color error		    color1 default          # error messages are Red
      color status		  color15 default         # status line "Subtext 0"
      color tree        color15 default         # thread tree arrows Subtext 0
      color tilde       color15 default         # blank line padding Subtext 0

      color hdrdefault  color13 default         # default headers Pink
      color header		  color13 default "^From:"
      color header	 	  color13 default "^Subject:"

      color quoted		  color15 default         # Subtext 0
      color quoted1		  color7 default          # Subtext 1
      color quoted2		  color8 default          # Surface 2
      color quoted3		  color0 default          # Surface 1
      color quoted4		  color0 default
      color quoted5		  color0 default

      color body		color2 default		[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+               # email addresses Green
      color body	  color2 default		(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+        # URLs Green
      color body		color4 default		(^|[[:space:]])\\*[^[:space:]]+\\*([[:space:]]|$) # *bold* text Blue
      color body		color4 default		(^|[[:space:]])_[^[:space:]]+_([[:space:]]|$)     # _underlined_ text Blue
      color body		color4 default		(^|[[:space:]])/[^[:space:]]+/([[:space:]]|$)     # /italic/ text Blue

      color sidebar_flagged   color1 default    # Mailboxes with flagged mails are Red
      color sidebar_new       color10 default   # Mailboxes with new mail are Green
    '';
  };
  xdg.configFile."neomutt/mailcap".text = ''
    text/html; firefox --new-window %s & sleep 2; test=test -n "$DISPLAY"; nametemplate=%s.html; copiousoutput;
    text/calendar; khal import %s;
    image/*; imv %s;
    video/*; mpv %s;
    audio/*; mpv %s;
    application/pdf; zathura %s;
  '';
}
