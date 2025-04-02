# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    # dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."arl_mongodb" = {
    image = "mongo:4.0.27";
    environment = {
      "MONGO_INITDB_DATABASE" = "arl";
      "MONGO_INITDB_ROOT_PASSWORD" = "admin";
      "MONGO_INITDB_ROOT_USERNAME" = "admin";
    };
    volumes = [
      "/home/kongjian/Hackertools/ARL-plus-docker/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro"
      "arl_db:/data/db:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=mongodb"
      "--network=arl_default"
    ];
  };
  systemd.services."podman-arl_mongodb" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-arl_default.service"
    ];
    requires = [
      "podman-network-arl_default.service"
    ];
    partOf = [
      "podman-compose-arl-root.target"
    ];
    wantedBy = [
      "podman-compose-arl-root.target"
    ];
  };
  virtualisation.oci-containers.containers."arl_rabbitmq" = {
    image = "ki9mu/shadow-rabbitmq:latest";
    environment = {
      "RABBITMQ_DEFAULT_PASS" = "arlpassword";
      "RABBITMQ_DEFAULT_USER" = "arl";
      "RABBITMQ_DEFAULT_VHOST" = "arlv2host";
    };
    log-driver = "journald";
    extraOptions = [
      "--network-alias=rabbitmq"
      "--network=arl_default"
    ];
  };
  systemd.services."podman-arl_rabbitmq" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-arl_default.service"
    ];
    requires = [
      "podman-network-arl_default.service"
    ];
    partOf = [
      "podman-compose-arl-root.target"
    ];
    wantedBy = [
      "podman-compose-arl-root.target"
    ];
  };
  virtualisation.oci-containers.containers."arl_scheduler" = {
    image = "ki9mu/arl-ki9mu:v3.0.1";
    environment = {
      "LANG" = "en_US.UTF-8";
      "TZ" = "Asia/Shanghai";
    };
    volumes = [
      "/home/kongjian/Hackertools/ARL-plus-docker/config-docker.yaml:/code/app/config.yaml:rw"
    ];
    dependsOn = [
      "arl_mongodb"
      "arl_rabbitmq"
    ];
    log-driver = "journald";
    extraOptions = [
      "--entrypoint=[\"sh\", \"-c\", \"wait-for-it.sh mongodb:27017; wait-for-it.sh rabbitmq:5672; python3.6 -m app.scheduler\"]"
      "--network-alias=scheduler"
      "--network=arl_default"
    ];
  };
  systemd.services."podman-arl_scheduler" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-arl_default.service"
    ];
    requires = [
      "podman-network-arl_default.service"
    ];
    partOf = [
      "podman-compose-arl-root.target"
    ];
    wantedBy = [
      "podman-compose-arl-root.target"
    ];
  };
  virtualisation.oci-containers.containers."arl_web" = {
    image = "ki9mu/arl-ki9mu:v3.0.1";
    environment = {
      "LANG" = "en_US.UTF-8";
      "TZ" = "Asia/Shanghai";
    };
    volumes = [
      "/home/kongjian/Hackertools/ARL-plus-docker/arl_web.log:/code/arl_web.log:rw"
      "/home/kongjian/Hackertools/ARL-plus-docker/config-docker.yaml:/code/app/config.yaml:rw"
      "/home/kongjian/Hackertools/ARL-plus-docker/image:/code/app/tmp_screenshot:rw"
      "/home/kongjian/Hackertools/ARL-plus-docker/poc:/opt/ARL-NPoC/xing/plugins/upload_poc:rw"
    ];
    ports = [
      "5003:443/tcp"
    ];
    dependsOn = [
      "arl_mongodb"
      "arl_rabbitmq"
    ];
    log-driver = "journald";
    extraOptions = [
      "--entrypoint=[\"sh\", \"-c\", \"gen_crt.sh; nginx; wait-for-it.sh mongodb:27017; wait-for-it.sh rabbitmq:5672; gunicorn -b 0.0.0.0:5003 app.main:arl_app -w 3 --access-logfile arl_web.log --access-logformat '%({x-real-ip}i)s %(l)s %(u)s %(t)s \"%(r)s\" %(s)s %(b)s \"%(f)s\" \"%(a)s\"'\"]"
      "--network-alias=web"
      "--network=arl_default"
    ];
  };
  systemd.services."podman-arl_web" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-arl_default.service"
    ];
    requires = [
      "podman-network-arl_default.service"
    ];
    partOf = [
      "podman-compose-arl-root.target"
    ];
    wantedBy = [
      "podman-compose-arl-root.target"
    ];
  };
  virtualisation.oci-containers.containers."arl_worker" = {
    image = "ki9mu/arl-ki9mu:v3.0.1";
    environment = {
      "LANG" = "en_US.UTF-8";
      "TZ" = "Asia/Shanghai";
    };
    volumes = [
      "/home/kongjian/Hackertools/ARL-plus-docker/arl_worker.log:/code/arl_worker.log:rw"
      "/home/kongjian/Hackertools/ARL-plus-docker/config-docker.yaml:/code/app/config.yaml:rw"
      "/home/kongjian/Hackertools/ARL-plus-docker/image:/code/app/tmp_screenshot:rw"
      "/home/kongjian/Hackertools/ARL-plus-docker/poc:/opt/ARL-NPoC/xing/plugins/upload_poc:rw"
    ];
    dependsOn = [
      "arl_mongodb"
      "arl_rabbitmq"
    ];
    log-driver = "journald";
    extraOptions = [
      "--entrypoint=[\"sh\", \"-c\", \"wait-for-it.sh mongodb:27017; wait-for-it.sh rabbitmq:5672; celery -A app.celerytask.celery worker -l info -Q arlgithub -n arlgithub -c 2 -O fair -f arl_worker.log & celery -A app.celerytask.celery worker -l info -Q arltask -n arltask -c 2 -O fair -f arl_worker.log\"]"
      "--network-alias=worker"
      "--network=arl_default"
    ];
  };
  systemd.services."podman-arl_worker" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-arl_default.service"
    ];
    requires = [
      "podman-network-arl_default.service"
    ];
    partOf = [
      "podman-compose-arl-root.target"
    ];
    wantedBy = [
      "podman-compose-arl-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-arl_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f arl_default";
    };
    script = ''
      podman network inspect arl_default || podman network create arl_default
    '';
    partOf = [ "podman-compose-arl-root.target" ];
    wantedBy = [ "podman-compose-arl-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-arl-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
