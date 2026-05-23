{
  pkgs,
  inputs,
  config,
  ...
}:
{
  programs.browserpass = {
    enable = true;
    browsers = [ "firefox" ];
  };

  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    package = (
      pkgs.firefox.override {
        # workaround: programs.firefox.policies doesn't seem to work
        extraPolicies = {
          DefaultDownloadDirectory = "${config.home.homeDirectory}/downloads";
          DisableFirefoxAccounts = true;
          DisplayBookmarksToolbar = "always";
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          FirefoxHome = {
            Search = true;
            Pocket = false;
            Snippets = false;
            TopSites = false;
            Highlights = false;
          };
          GenerativeAI = false;
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          PasswordManagerEnabled = false;
          ExtensionUpdate = true;
        };
      }
    );
    profiles.default = {
      isDefault = true;
      search = {
        engines = {
          "ddg".metaData.alias = "@d";
          "google".metaData.alias = "@g";
        };
        force = true;
        default = "ddg";
        order = [
          "google"
          "ddg"
        ];
      };
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          browserpass
          duckduckgo-privacy-essentials
          ublock-origin
          firefox-color
          dictionary-german
          french-dictionary
        ];
        force = true;
      };
      settings = {
        "browser.startup.homepage" = "https://duckduckgo.com";
        "browser.search.region" = "CH";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "de-CH";
        "general.useragent.locale" = "de-CH";
        "sidebar.verticalTabs" = true;
      };
    };
  };
}
