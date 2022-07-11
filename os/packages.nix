{ config, pkgs, fetchFromGitHub, ... }:

let
  mozilla = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  rust = (pkgs.rustChannelOf { date = "2022-06-30"; channel = "stable"; }).rust.override {
    targets = [ "wasm32-unknown-unknown" "armv7-unknown-linux-gnueabihf" ];
    extensions = [
      "rust-std"
      "rust-src"
    ];
  };
in {
  nixpkgs.overlays = [mozilla (self: super: {
    discord = super.discord.overrideAttrs (_: {
      src = builtins.fetchTarball "https://discordapp.com/api/download?platform=linux&format=tar.gz";
    });

    signal-desktop = super.signal-desktop.overrideAttrs (_: {
      src = builtins.fetchurl {
        url = "https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_5.42.0_amd64.deb";
        sha256 = "01cs7h8yqjn0i0b62svncpr8l4mg52z3v8j40wb5y3cswbns6d66";
      };
    });

    slock = super.slock.overrideAttrs (_: {
      src = builtins.fetchTarball {
        url = "https://github.com/mara214/slock/archive/refs/tags/1.4.6.tar.gz";
        sha256 = "0lg5s1l0fzz44liyh9kfnhyka3d9zn8b88xx7naamn8g8rr3s4s1";
      };
    });

    plantuml = super.plantuml.overrideAttrs (_: {
      version = "1.2021.15";
      src = builtins.fetchurl {
        url = "https://github.com/plantuml/plantuml/releases/download/v1.2021.15/plantuml-1.2021.15.jar";
        sha256 = "0s00s2ah0grqc998rn59zb6im7wgmxj2ngksd438k1hbpq1js6f7";
      };
    });

    neovim-unwrapped = super.neovim-unwrapped.overrideAttrs (_: {
      version = "0.7.0";
      src = pkgs.fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "v0.7.0";
        sha256 = "03wh090acplj5kgrw87m6dh0rh5f71bg60s75qmqcsfjjwg1m1kr";
      };

      buildInputs = super.neovim-unwrapped.buildInputs ++ [ pkgs.tree-sitter ];

      cmakeFlags = super.neovim-unwrapped.cmakeFlags ++ [ "-DUSE_BUNDLED=OFF" ];
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
    man-pages
    nix
    playerctl
    usbutils
    unixtools.xxd
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
    rclone
    ripgrep
    rofi
    scrot
    unrar
    zip unzip

    # network packages
    openconnect
    openssl

    # ui packages
    feh
    gnome3.nautilus
    pavucontrol
    system-config-printer
    trayer
    volumeicon
    xmobar

    # user packages
    alacritty 
    anki
    biber
    chromium
    discord
    dropbox-cli
    enpass
    evince
    exercism
    firefox
    libreoffice
    minecraft
    mypaint
    signal-desktop
    slack
    spotify
    st
    surf
    (texlive.combine {
      inherit (texlive)
      apa
      biblatex biblatex-apa
      csquotes
      glossaries
      fontaxes
      hyphenat
      latexindent
      latexmk
      lipsum
      listing
      plex
      scheme-full
      textpos;
    }) 
    plantuml
    vault

    # coding packages
    docker
    docker-compose
    flutter
    gcc
    ghc
    go
    jetbrains.clion
    jetbrains.datagrip
    jetbrains.idea-ultimate
    kubectl
    terraform-full
    libsodium
    neovim
    nodejs
    openssl
    pkgconfig
    python39
    rust
    rustup
    stack
    tig
    terraform-full
    vscode
    watchman
  ];

  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };
}
