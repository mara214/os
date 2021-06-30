{ config, pkgs, ... }:

let
  mozilla_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  rust = (pkgs.rustChannelOf { date = "2021-06-14"; }).rust.override {
    extensions = [
      "rust-src"
      "rls-preview"
      "clippy-preview"
      "rustfmt-preview"
    ];
  };
in {
  nixpkgs.overlays = [mozilla_overlay (self: super: {
    discord = super.discord.overrideAttrs (_: {
      src = builtins.fetchTarball "https://discordapp.com/api/download?platform=linux&format=tar.gz";
    });

    signal-desktop = super.signal-desktop.overrideAttrs (_: {
      src = builtins.fetchurl {
        url = "https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_5.4.0_amd64.deb";
        sha256 = "046xy033ars70ay5ryj39i5053py00xj92ajdg212pamq415z1zb";
      };
    });

    slock = super.slock.overrideAttrs (_: {
      src = builtins.fetchTarball {
        url = "https://github.com/schulke-214/slock/archive/refs/tags/1.4.2.tar.gz";
        sha256 = "10r3yiz42b93avr06yd97gagqpafj9gqpl9f2n55z3hqa6jmhfvp";
      };
    });
  })];

  environment.variables.QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  environment.variables.QT_SCREEN_SCALE_FACTORS = "1";
  environment.systemPackages = with pkgs; [
    # system packages
    bind
    binutils
    coreutils
    file
    git
    htop
    killall
    manpages
    nix
    openssl
    ofono
    playerctl
    usbutils
    wpa_supplicant_gui
    xfontsel
    xlsfonts
    xclip
    xdotool
    xscreensaver
    xorg.xbacklight
    xorg.xset
    xorg.xmodmap
    xorg.xev
    zsh

    # utility packages
    acpi
    autorandr
    arandr
    bat
    broot
    curl
    dmenu
    exa
    fd
    fzf
    httpie
    peek
    pstree
    ranger
    ripgrep
    rofi
    scrot
    unrar
    zip unzip

    # network packages
    openconnect

    # ui packages
    feh
    gnome3.nautilus
    pavucontrol
    trayer
    volumeicon
    xmobar

    # user packages
    alacritty 
    anki
    chromium
    discord
    dropbox-cli
    enpass
    evince
    exercism
    latest.firefox-beta-bin
    libreoffice
    minecraft
    mypaint
    spotify
    slack
    signal-desktop
    thunderbird
    (texlive.combine { inherit (texlive) scheme-medium latexindent latexmk listing hyphenat textpos; }) 
    plantuml
    vault

    # coding packages
    docker
    docker_compose
    go
    gcc
    ghc
    idea.idea-ultimate
    idea.datagrip
    neovim
    nodejs
    python39
    rust
    stack
    tig
    vscode
    watchman
  ];

  programs.steam.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };
}
