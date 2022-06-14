{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "$SHELL -l";
        user = "lgo";
      };
      default_session = initial_session;
    };
  };
}
