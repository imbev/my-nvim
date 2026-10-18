{ pkgs, ... }:
{
  diagnostic.settings = {
    virtual_text = true;
    update_in_insert = true;
  };

  extraPackages = [ pkgs.nixfmt ];

  plugins.lsp = {
    enable = true;

    keymaps.lspBuf = {
      "grf" = {
        action = "format";
        mode = [
          "n"
          "v"
        ];
        desc = "Format buffer";
      };
      "grn" = {
        action = "rename";
        desc = "Rename symbol";
      };
      "gra" = {
        action = "code_action";
        mode = [
          "n"
          "v"
        ];
        desc = "Code action";
      };
    };

    servers = {
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      basedpyright.enable = true;
      ruff.enable = true;
      nixd.enable = true;
    };
  };
}
