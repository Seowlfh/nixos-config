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
    anki
    file
    bat
    xsel
    slack
    pavucontrol
    gcc
    vim
    tmux
    arandr
    poetry
    pre-commit

    # Neovim's dep
    ripgrep
    clang-tools

    # Utils
    xclip
    wget

    # LSP
    nil # Nix
    lua-language-server # Lua

    # Latex/Md
    pandoc
    texliveSmall
  ]
