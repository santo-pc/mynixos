{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "minimalist-sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "santo-pc";
        repo = "minimalist-sddm-theme";
        rev = "1478e8c1f3f69f61a70cac15c462362603d07cb5";
        sha256 = "sha256-kPd0wavtinaFSjqacF6U1p9qxncfbLMv9IW5p3rtN1A=";
    };
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
