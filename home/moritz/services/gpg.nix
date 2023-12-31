{ config, ... }: {
  programs.gpg = { enable = true; };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 21600;
    maxCacheTtl = 21600;
    pinentryFlavor = "qt";
  };

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".gnupg" ];
  };
}
