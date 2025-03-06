{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "minimalist-sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "santo-pc";
        repo = "minimalist-sddm-theme";
        rev = "e98acba14e5ee191b7007f240aca29e7d3efeb0";
        sha256 = "sha256-kPd0wavtinaFSjqacF6U1p9qxncfbLMv9IW5p3rtN1A=";
    };
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
