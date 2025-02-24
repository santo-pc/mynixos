{ config, pkgs, ... }:

{
	services = {
		dbus.enable = true;
		picom.enable = true;
		openssh.enable = true;
		spice-vdagentd.enable = true;
    blueman.enable = true;
		displayManager = {
			sddm.enable = true;
			sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
		};

		xserver = {
			enable = true;
			xkb.options = "grp:alt_shift_toggle, caps:swapescape";
			desktopManager.gnome.enable = true;
		};
	};
}
