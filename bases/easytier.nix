{...}:
{services.easytier={
  enable = true;
  instances = {
    settings = {
    # ipv4 = "10.144.144.1/24";
    hostname = "nixosPC";
    dhcp = true;
    network_name = "kongjianghost";
    network_secret = "kongjian520";
    peers = [
      "tcp://39.104.77.44:11010"
    ];
  };
  }
}}