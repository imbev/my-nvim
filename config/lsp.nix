{ pkgs, ... }:
{
  diagnostic.settings = {
    virtual_text = true;
    update_in_insert = true;
  };

  extraPackages = [ pkgs.nixfmt ];

  plugins = {
    lsp = {
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
        emmet_language_server.enable = true;
      };
    };

    cmp = {
      enable = true;

      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";

          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require('luasnip').expand_or_jumpable() then
                require('luasnip').expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' })
          '';

          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' })
          '';
        };
      };
    };

    luasnip.enable = true;
  };
}
