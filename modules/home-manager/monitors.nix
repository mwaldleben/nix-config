{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.monitors = mkOption {
    type = types.listOf (
      types.submodule {
        options = {
          name = mkOption {
            type = types.str;
            example = "DP-1";
          };
          width = mkOption {
            type = types.int;
            example = 1920;
          };
          height = mkOption {
            type = types.int;
            example = 1080;
          };
          refreshRate = mkOption {
            type = types.int;
            default = 60;
          };
          x = mkOption {
            default = "auto";
          };
          y = mkOption {
            default = "auto";
          };
          scale = mkOption {
            type = types.float;
            default = 1.0;
          };
          workspace = mkOption {
            type = types.nullOr types.str;
            default = null;
          };
        };
      }
    );
    default = [ ];
  };
}
