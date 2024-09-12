{ pkgs }:
with pkgs; [
    firefox
    python311
    discord
    neofetch
    scrot
    spotify
    man-pages
    man-pages-posix
    gdb
    gnumake
    feh
    zathura
    latexrun
    xdotool
    pstree
    htop
    unzip
    tree
    cmake
    valgrind
    anki-bin
    file
    bat
    xsel
    slack
    pavucontrol
    gcc
    vim
    tmux
    poetry
    pre-commit
    glab

    # Neovim's dep
    ripgrep
    clang-tools

    # Utils
    xclip
    wget

    # LSP
    nil # Nix
    lua-language-server # Lua
    # Formatters
    stylua
    nixpkgs-fmt

    # Latex/Md
    pandoc
    texliveSmall

    krb5
    sshfs
  ]
