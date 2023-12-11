{ lib, config, ... }:
let
  mkFontOption = kind: {
    family = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Family name for ${kind} font profile";
      example = "Hack";
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = null;
      description = "Package for ${kind} font profile";
      example = "pkgs.hack";
    };
  };
  cfg = config.fontProfiles;
in {
  options.fontProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
    monospace = mkFontOption "monospace";
    regular = mkFontOption "regular";
    emoji = mkFontOption "emoji";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages =
      [ cfg.monospace.package cfg.regular.package cfg.emoji.package ];

    # write fonts.conf file manually, no home-manager options
    home.file.".config/fontconfig/fonts.conf".text = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <fontconfig>
      <alias>
        <family>sans-serif</family>
        <prefer>
          <family>${cfg.regular.family} Sans</family>
          <family>${cfg.emoji.family}</family>
        </prefer>
      </alias>
      <alias>
        <family>serif</family>
        <prefer>
          <family>${cfg.regular.family} Serif</family>
          <family>${cfg.emoji.family}</family>
        </prefer>
      </alias>
      <alias>
        <family>monospace</family>
        <prefer>
          <family>${cfg.monospace.family} Mono</family>
          <family>${cfg.emoji.family}</family>
         </prefer>
       </alias>
      </fontconfig>
    '';
  };
}
