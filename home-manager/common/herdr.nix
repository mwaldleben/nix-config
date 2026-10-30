{  ... }:
{
  programs.herdr = {
    enable = true;
    settings = {
      keys = {
        prefix = "ctrl+space";
      };
      onboarding = false;
      terminal = {
        default_shell = "zsh";
        new_cwd = "follow";
        shell_mode = "auto";
      };
      ui = {
        agent_panel_sort = "priority";
        sidebar_width = 32;
        sound = {
          enabled = false;
        };
        toast = {
          delivery = "herdr";
        };
      };
    };
  };
}
