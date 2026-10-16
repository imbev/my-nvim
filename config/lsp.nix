{
  diagnostic.settings = {
    virtual_text = true;
    update_in_insert = true;
  };

  plugins.lsp = {
    enable = true;

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
