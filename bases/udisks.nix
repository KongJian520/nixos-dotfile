{
  config,
  pkgs,
  inputs,
  ...
}:
{
  services.udisks2.enable = true;
  services.udisks2.mountOnMedia = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
    "ext4"
  ]; # 按需添加格式

}
