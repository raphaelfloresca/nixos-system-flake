# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/bfa4f1ff-7b6d-4036-ba8e-837d714a025b";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/bfa4f1ff-7b6d-4036-ba8e-837d714a025b";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/bfa4f1ff-7b6d-4036-ba8e-837d714a025b";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/bfa4f1ff-7b6d-4036-ba8e-837d714a025b";
      fsType = "btrfs";
      options = [ "subvol=@persist" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/bfa4f1ff-7b6d-4036-ba8e-837d714a025b";
      fsType = "btrfs";
      options = [ "subvol=@log" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/c27fb5f6-7c45-4757-b8f4-b9bc5f18b336";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/8C81-545C";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}