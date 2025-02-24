{ config, pkgs, ... }: 

{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    nvidia.modesetting.enable = true;
    opengl = {
      enable = true;
    };
  };
}
