{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.programs.hypr-cheat-sheet;
in
{
  options.programs.hypr-cheat-sheet = {
    enable = lib.mkEnableOption "Hyprland cheat sheet using wofi";

    hyprConfig = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.config/hypr/hyprland.conf";
      description = "Path to hyprland.conf";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "hypr-cheat-sheet";

        runtimeInputs = with pkgs; [
          wofi
          gnugrep
          gawk
          gnused
          hyprland
        ];
        text = ''
          HYPR_CONF="${cfg.hyprConfig}"

          mapfile -t BINDINGS < <(
            grep -E '^\s*bind[a-z]*\s*=' "$HYPR_CONF" | \
            sed -E 's/^\s*bind[a-z]*\s*=\s*//; s/\s*,\s*/,/g' | \
            awk -F, '{
              key = $1 " + " $2;
              action = $3;
              cmd="";
              for(i=4;i<=NF;i++) cmd=cmd $i " ";
              printf "%s\t%s\t%s\n", key, action, cmd
            }'
          )

          CHOICE=$(printf '%s\n' "''${BINDINGS[@]}" | \
            wofi --dmenu --insensitive --prompt "Hypr Cheat Sheet")

          CMD="''${CHOICE##*| }"

          if [[ -z "$CMD" ]]; then
            exit 0
          fi

          if [[ $CMD == exec* ]]; then
            eval "$CMD"
          else
            hyprctl dispatch "$CMD"
          fi
        '';
      })
    ];
  };
}
