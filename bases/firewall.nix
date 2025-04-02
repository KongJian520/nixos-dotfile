{ ... }:
{
  networking.firewall = {
    enable = true;
    allowPing = false;
    # allowedTCPPortRanges[
    #   { from = 4000; to = 4007; }
    #   { from = 8000; to = 8010; }
    # ];
    # allowedTCPPorts = [ 80 443 ];
    # allowedUDPPortRanges = [
    #   { from = 4000; to = 4007; }
    #   { from = 8000; to = 8010; }
    # ];
  };
}
