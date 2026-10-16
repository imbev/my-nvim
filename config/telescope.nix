{ pkgs, ... }:
{
  plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Telescope find files";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Telescope live grep";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Telescope buffers";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Telescope help tags";
      };
      "<leader>fd" = {
        action = "diagnostics";
        options.desc = "Telescope diagnostics";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Telescope recent files";
      };
    };
  };

  # `live_grep` shells out to ripgrep; nixvim only pulls in `bat` (previewer)
  # as a telescope dependency, so provide the binary explicitly.
  extraPackages = [ pkgs.ripgrep ];
}
