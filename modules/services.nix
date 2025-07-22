{ config, pkgs, ... }:
{
	services.desktopManager.plasma6.enable = false;
	services.displayManager.sddm.wayland.enable = true;
	programs.ssh.askPassword = pkgs.lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass"; 

	services = {
		dbus.enable = true;
		picom.enable = true;
		openssh.enable = true;
		spice-vdagentd.enable = true;
		blueman.enable = true;

		displayManager = {
			sddm = {
				enable = true;
				# theme = "corners";
				# package = pkgs.lib.mkForce pkgs.libsForQt5.sddm;
				# extraPackages = pkgs.lib.mkForce [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];
				# theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
			};
		};

		xserver = {
			enable = true;
			xkb.options = "grp:alt_shift_toggle, caps:swapescape";
			desktopManager.gnome.enable = true;
		};
	};
}
