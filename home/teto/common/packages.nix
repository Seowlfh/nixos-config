{ pkgs }:
with pkgs; [
    firefox
    python311
    discord
    scrot
    spotify
    man-pages
    man-pages-posix
    feh
    zathura
    latexrun
    htop
    zip unzip
    tree
    anki-bin
    file
    xsel
    pavucontrol
    vim
    tmux
    pre-commit
    bear

    # Neovim's dep
    ripgrep
    clang-tools
    go # gitlab.nvim
    gnumake
    gcc

    # Utils
    xclip
    wget

    # LSP
    nil # Nix
    lua-language-server # Lua
    # Formatters
    stylua
    nixpkgs-fmt

    sshfs
  ]
