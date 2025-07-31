{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "minimalist-sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "santo-pc";
    repo = "minimalist-sddm-theme";
    rev = "11d9984b58735277d92f4702f66341aa0c037764";
    sha256 = "sha256-kPd0wavtinaFSjqacF6U1p9qxncfbLMv9IW5p3rtN1A=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
