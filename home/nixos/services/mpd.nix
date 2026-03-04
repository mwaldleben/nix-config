{
  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;
    playlistDirectory = "/home/moritz/music/playlists";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
