{ config, ... }:
{
  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;
    playlistDirectory = "${config.home.homeDirectory}/music/playlists";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
