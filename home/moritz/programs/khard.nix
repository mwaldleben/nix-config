{
  programs.khard = {
    enable = true;
    settings = {
      general = { default_action = "list"; };
      "contact table" = {
        preferred_phone_number_type = [ "cell" "home" ];
        preferred_email_address_type = [ "work" "home" ];
      };
    };
  };
}
