{ config, globals, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  home.file = {
    "bin/1password_sudoask.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        set -euo pipefail

        # Adjust item name / field to your vault entry
        exec op item get ${globals.user.password-1p-item} --format json --fields password | jq -r '.value'
      '';
    };

    # build using 1password
    "bin/nix-build-1p.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        set -e

        # query 1password for sudo pass
        export SUDO_ASKPASS="${homeDir}/bin/1password_sudoask.sh"

        echo "Moving to config directory..."
        cd "${globals.user.nixConfigDirectory}"

        echo "Running nixos-rebuild switch..."
        sudo -A nixos-rebuild switch --flake .#${globals.user.host} --show-trace

        echo "✅ Build switch complete!"
      '';
    };
    # update using 1password
    "bin/nix-update-1p.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        set -e

        # query 1password for sudo pass
        export SUDO_ASKPASS="${homeDir}/bin/1password_sudoask.sh"

        echo "Moving to config directory..."
        cd "${globals.user.nixConfigDirectory}"

        echo "Updating flake lockfile..."
        nix flake update

        echo "Running nixos-rebuild switch..."
        sudo -A nixos-rebuild switch --flake .#${globals.user.host} --show-trace
        echo "✅ Update complete!"
      '';
    };
  };

}
