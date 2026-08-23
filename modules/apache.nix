{
  flake.nixosModules.apache =
    let
      domainName = "zkdl.online";
    in
    {
      services.httpd = {
        enable = true;
        adminAddr = "admin@${domainName}";

        extraModules = [
          "lua"
        ];

        virtualHosts."${domainName}" = {
          enableACME = true;
          forceSSL = true;

          documentRoot = "~/zkdl/www/${domainName}";
        };
      };
    };
}
