{ persistence, lib, ... }:
{
  # Enable acme for usage with nginx vhosts
  security.acme = {
    defaults.email = "lutz0go@gmail.com";
    acceptTerms = true;
  };

  environment.persistence = lib.mkIf persistence {
    "/persist" = {
      directories = [
        "/var/lib/acme"
      ];
    };
  };
}
