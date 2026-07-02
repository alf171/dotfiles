{ pkgs, ... }:

{
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tree-sitter
    # needed for lsp
    nodejs
    unzip
    neovim
    tmux
    git
    fd
    ripgrep
    fzf

    zig
    clang
    cmake
    ninja

    python3
    lua-language-server
    nil
    stylua

    cloc
    rustup

    man-pages
  ];
}
