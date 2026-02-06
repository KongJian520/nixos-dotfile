{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware.graphics = {
    enable = true;
  };
  services.xserver.videoDrivers = [
    "nvidia"
  ];
  boot.kernelParams = [ "acpi_backlight=native" ];
  environment.systemPackages = with pkgs; [
    vpl-gpu-rt
    # (writeShellScriptBin "nvidia-offload" ''
    #   export __NV_PRIME_RENDER_OFFLOAD=1
    #   export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    #   export __GLX_VENDOR_LIBRARY_NAME=nvidia
    #   export __VK_LAYER_NV_optimus=NVIDIA_only
    #   export VK_ICD_FILENAMES=/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json:$VK_ICD_FILENAMES
    #   exec "$@"
    # '')

  ];
  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
