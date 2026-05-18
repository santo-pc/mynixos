# { pkgs, ... }:
# {
#   xdg.portal = {
#     enable = true;
#     wlr.enable = false;
#     xdgOpenUsePortal = true;
#     extraPortals = [
#       pkgs.xdg-desktop-portal-hyprland
#       pkgs.xdg-desktop-portal-gtk
#     ];
#   };
#
#   programs = {
#     xwayland = {
#       enable = true;
#     };
#
#     # hyprland = {
#     #   enable = true;
#     #   portalPackage = pkgs.xdg-desktop-portal-hyprland;
#     #
#     #   xwayland = {
#     #     enable = true;
#     #   };
#     # };
#     #
#     gnupg = {
#       agent = {
#         enable = true;
#         enableSSHSupport = true;
#       };
#     };
#
#     nix-ld = {
#       enable = true;
#       libraries = with pkgs; [
#         # Add any missing dynamic libraries for unpackaged programs
#         rpc
#         lua-language-server
#       ];
#     };
#
#   };
#
# }
