{
  config,
  pkgs,
  inputs,
  ...
}:
{
  services.udisks2.enable = true;
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
    "ext4"
  ]; # 按需添加格式
  udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "always";
    settings = {
      program_options = {
        # file_manager = "${pkgs.xdg-utils}/bin/xdg-open";
        file_manager = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.yazi}/bin/yazi";
      };
    };
  };

}
