{
  programs.nixvim.autoCmd = [
    {
      desc = "Unfold everything when opening a file";
      event = ["BufEnter" "BufWinEnter"];
      command = "normal! zR";
    }
    {
      desc = "Format with LSP on save when possible";
      event = ["BufWritePre"];
      command = "lua vim.lsp.buf.format()";
    }
  ];
}
