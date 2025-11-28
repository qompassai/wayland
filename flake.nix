# /qompassai/wayland/flake.nix
# ---------------------------
# Copyright (C) 2025 Qompass AI, All rights reserved

{
  description = "Qompass AI Wayland Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "wayland-env";
      paths = with pkgs; [
        wayland
        wayland-protocols
        wlroots
        hyprland
        uwsm
        pipewire
        libva-full
        v4l-utils
        wlr-randr
        wlrctl
      ];
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        wayland
        wayland-protocols
        wlroots
        hyprland
        uwsm
        pipewire
        libva-full
        v4l-utils
        wlr-randr
        wlrctl
      ];
      shellHook = ''
        echo "Qompass AI Wayland-Hyprland development environment ready!"
        echo "Included components: wayland, hyprland, uwsm pipewire, libva, v4l, and wlr protocols."
      '';
    };
  };
}

