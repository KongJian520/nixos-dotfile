{ pkgs, ... }:
{
imports=[./docker-compose];
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  # virtualisation.vmware.host.enable = true;
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      daemon.settings = {
        proxies = {
          http-proxy = "http://127.0.0.1:7890";
          https-proxy = "http://127.0.0.1:7890";
          no-proxy = "*.test.example.com,.example.org,127.0.0.0/8";
        };
      };
    };
    podman = {
      enable = true;
      dockerCompat = false;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
  virtualisation.oci-containers.containers = {
    zashboard = {
      image = "ghcr.io/zephyruso/zashboard:latest";
      autoStart = true;
      ports = [
        "13001:80"
      ];
    };
  };
  # Useful other development tools
  environment.systemPackages = with pkgs; [
    # dive # look into docker image layers
    podman-tui # status of containers in the terminal
    podman-compose # start group of containers for dev
  ];
  programs.virt-manager.enable = true;
  users.groups.docker.members = [ "kongjian" ];
  users.groups.libvirtd.members = [ "kongjian" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

}
