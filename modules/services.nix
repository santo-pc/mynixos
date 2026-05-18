{
  pkgs,
  ...
}:
{
  programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";

  services = {
    dbus.enable = true;
    picom.enable = true;
    openssh.enable = true;
    spice-vdagentd.enable = true;
    blueman.enable = true;
    displayManager = {
      defaultSession = "niri";
      sddm = {
        enable = true;
        wayland = {
          compositor = "kwin";

        };

        theme = "catppuccin-mocha-mauve";
      };
    };

    xserver = {
      enable = true;
      xkb.options = "grp:alt_shift_toggle, caps:swapescape";
    };

    desktopManager = {
      plasma6.enable = false;
      gnome.enable = true;
    };
  };

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
  ];

  programs.niri.enable = true; # Niri session in the display manager
}
