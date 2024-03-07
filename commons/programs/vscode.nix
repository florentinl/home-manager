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
      redhat.vscode-xml
    ];
    userSettings = {
      # VSCode settings
      "editor.formatOnSave" = true;
      "explorer.confirmDelete" = false;

      # rust-analyzer extension settings -> use rust-analyzer binary instead of downloading it
      # "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      # "xml.server.binary.path" = "${pkgs.lemminx}/bin/lemminx";

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

      # Enable GitHub Copilot in Markdown
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = true;
        "scminput" = false;
      };

      # Configure Some Extensions
      "redhat.telemetry.enabled" = false;
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
