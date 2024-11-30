{
    pkgs,
    ...
}:
pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        makeWrapper
        bashInteractive
    ];

    NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
      stdenv.cc.cc
      glibc
      libselinux
    ]);

    NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";

    buildInputs = with pkgs; [
      gnumake
      cmake
      ccls
      bear
    ];

    sourceRoot = ".";

    # https://github.com/NixOS/nixpkgs/issues/18995
    hardeningDisable = [ "all" ];


    shellHook = ''
      echo "Hello from shell!"
    '';
}

