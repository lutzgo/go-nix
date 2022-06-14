{
  programs.ssh =  {
    enable = true;
    matchBlocks = {

      "gitlab.com" = {
        addressFamily = "inet";
      };

      "*.local" = {
        addressFamily = "inet";
      };
      
      "tomala-server" = {
          hostname = "getgoto.de";
          identityFile = "~/.ssh/tomala-server-curve.pub";
          identitiesOnly = true;
          user = "tomala1";
          port = 39901;
        };
    };
  };
}
