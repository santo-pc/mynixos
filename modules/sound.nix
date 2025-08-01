{ pkgs, ... }:

{
  # sound.enable = true;
  security.rtkit.enable = true;
  # hardware.pulseaudio.enable = false;
  services.pulseaudio.enable= false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
  ];
}
