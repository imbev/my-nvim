{ pkgs, ... }:
{
  imports = [
    ./bufferline.nix
    ./colorscheme.nix
    ./lsp.nix
    ./telescope.nix
  ];

  globals.mapleader = " ";

  opts = {
    number = true;
    relativenumber = true;
  };
}
