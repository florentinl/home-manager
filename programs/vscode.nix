{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      asvetliakov.vscode-neovim
      github.copilot
      jnoortheen.nix-ide
      github.copilot-chat
      piousdeer.adwaita-theme
    ];
    userSettings = {
      # Set affinity for Neovim
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };

      # Set font to CaskaydiaCove Nerd Font
      "editor.fontFamily" = "CaskaydiaCove Nerd Font";
      "editor.fontLigatures" = true;
      "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font";

      # Trim trailing whitespace and lines
      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;

      # Adwaita theme
      "editor.renderLineHighlight" = "none";
      "window.titleBarStyle" = "native";
      "window.commandCenter" = true;
      "window.menuBarVisibility" = "toggle";
      "window.autoDetectColorScheme" = true;
      "workbench.layoutControl.enabled" = false;
      "workbench.preferredDarkColorTheme" = "Adwaita Dark";
      "workbench.preferredLightColorTheme" = "Adwaita Light";
      "workbench.productIconTheme" = "adwaita";
      "workbench.colorTheme" = "Adwaita Dark";
      "workbench.iconTheme" = null;
      "workbench.tree.indent" = 12;
    };

    keybindings = [
      # Toggle terminal with Super+j
      { key = "ctrl+j"; command = "workbench.action.terminal.toggleTerminal"; }
      # Toggle File Explorer with Super+e
      { key = "ctrl+e"; command = "workbench.view.explorer"; when = "!sideBarVisible || !sideBarFocus"; }
      # Hide File Explorer with Super+e
      { key = "ctrl+e"; command = "workbench.action.closeSidebar"; when = "sideBarFocus"; }
    ];
  };
}
