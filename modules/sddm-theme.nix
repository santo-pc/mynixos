{ pkgs, lib, ... }:

pkgs.stdenv.mkDerivation {
  name = "minimalist-sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "santo-pc";
    repo = "minimalist-sddm-theme";
    rev = "b3eeee6eb62daab802cdf3fde888c6035207dbfa";
    # sha256 = lib.fakeSha256;
    sha256 = "vBeq+j51QiFO9gec4St21t4rTdiN833R6pL/cMBIK2s=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
