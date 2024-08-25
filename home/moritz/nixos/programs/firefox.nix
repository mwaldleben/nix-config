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
          "DuckDuckGo".metaData.alias = "@d";
          "Google".metaData.alias = "@g";
        };
        force = true;
        default = "DuckDuckGo";
        order = [
          "Google"
          "DuckDuckGo"
        ];
      };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        browserpass
        duckduckgo-privacy-essentials
        firefox-color # manually choose catppuccin colorscheme https://github.com/catppuccin/firefox
        ublock-origin
        vimium # manually choose catppuccin colorscheme https://github.com/catppuccin/vimium

        dictionary-german
        french-dictionary
      ];
      settings = {
        "browser.startup.homepage" = "https://duckduckgo.com";
        "browser.search.region" = "CH";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "de-CH";
        "general.useragent.locale" = "de-CH";
      };
    };
  };

  home.persistence = {
    "/persist/home/${config.home.username}".directories = [ ".mozilla/firefox" ];
  };
}
