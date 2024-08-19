{
  programs.nixvim.autoCmd = [
    {
      desc = "Format with LSP on save when possible";
      event = [ "BufWritePre" ];
      command = "lua vim.lsp.buf.format()";
    }
    {
      desc = "Format with LSP on quit insert mode";
      event = [ "InsertLeave" ];
      command = "lua vim.lsp.buf.format()";
    }
  ];
}
