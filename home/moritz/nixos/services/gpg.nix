{ config, pkgs, ... }:
{
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 3600;
    maxCacheTtlSsh = 3600;
    enableScDaemon = true;
    enableSshSupport = true;
    sshKeys = [ "E79176999CD6967EDFF33456D2A4998C974C7DDB" ];
    enableZshIntegration = true;
    pinentry.package = pkgs.pinentry-qt;
    enableExtraSocket = true;
  };
}
