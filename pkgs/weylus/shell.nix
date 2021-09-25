{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "weylus";
  targetPkgs = pkgs: (with pkgs; [
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
    xorg.libXft
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXrender
    xorg.libXfixes
    xorg.libXtst
    xorg.libXcomposite
    xorg.libXi
    xorg.libXv

    libdrm
    libva
    libtool

    glib
    gtk2
    pango
    fontconfig

    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base

    dbus
  ]);
  runScript = "zsh";
}).env
