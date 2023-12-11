{
  programs.gpg = { enable = true; };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 21600;
    maxCacheTtl = 21600;
    pinentryFlavor = "gtk2";
  };
}
