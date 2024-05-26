{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil_ls = {
        enable = true;
        extraOptions.settings = {
          nil.formatting.command = ["nix" "fmt" "--" "-"];
        };
      };
      pyright.enable = true;
    };
    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "gt" = "type_definition";
      "gi" = "implementation";
      "K" = "hover";
    };
  };
}
