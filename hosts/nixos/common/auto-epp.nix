{
  services.auto-epp = {
    enable = true;
    settings = {
      Settings.epp_state_for_BAT = "power";
      Settings.epp_state_for_AC = "balance_power";
    };
  };
}
