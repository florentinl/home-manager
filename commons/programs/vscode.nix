{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      github.copilot
      jnoortheen.nix-ide
      github.copilot-chat
    ];
    userSettings = {
      # VSCode settings
      "editor.formatOnSave" = true;
      "explorer.confirmDelete" = false;

      # Nix-IDE settings
      nix.enableLanguageServer = true;
      nix.serverPath = "nil";

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
      "window.titleBarStyle" = "native";
      "window.commandCenter" = true;
      "window.menuBarVisibility" = "toggle";
      "window.autoDetectColorScheme" = true;
      "workbench.layoutControl.enabled" = false;
      "workbench.tree.indent" = 12;
      "workbench.sideBar.location" = "right";

      # Enable GitHub Copilot in Markdown
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = true;
        "scminput" = false;
      };
    };

    keybindings = [
      # Toggle terminal with Super+j
      {
        key = "ctrl+j";
        command = "workbench.action.terminal.toggleTerminal";
      }
      # Toggle File Explorer with Super+e
      {
        key = "ctrl+e";
        command = "workbench.view.explorer";
        when = "!sideBarVisible || !sideBarFocus";
      }
      # Hide File Explorer with Super+e
      {
        key = "ctrl+e";
        command = "workbench.action.closeSidebar";
        when = "sideBarFocus";
      }
    ];
  };
}
