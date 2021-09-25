with import <nixpkgs> {};

let
  version = "0.11.1";
in
  stdenv.mkDerivation {
    name = "weylus-${version}";

    buildInputs = with pkgs; [ ];

    src = pkgs.fetchzip {
      url = "https://github.com/H-M-H/Weylus/releases/download/v${version}/linux.zip";
      sha256 = "0kdf366g3xc8pd00z8ki84q4r4cwrk7iwc5cdkzfnw3phrx9hsbv";
      stripRoot = false;
    };

    # src = builtins.fetchTarball {
    #   url = "https://github.com/H-M-H/Weylus/archive/refs/tags/v${version}.tar.gz";
    #   sha256 = "1v5vi2sk6ix372kqjg1vl7fyr930v9j7qvpy6zlpxkxzz7zcp30z";
    # };

    # buildPhase = ''
    #   cargo install cargo-deb
    #   ./configure --prefix=/usr
    #   make -j$(nproc)
    #   make install
    # '';

    installPhase = ''
      mkdir -p $out/bin
      cp weylus $out/bin/weylus
    '';
  }

