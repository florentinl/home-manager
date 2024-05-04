{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = true;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      # asvetliakov.vscode-neovim
      vscodevim.vim
      jnoortheen.nix-ide
      github.copilot
      github.copilot-chat
      mkhl.direnv

      # C/C++ stuff
      ms-vscode.cmake-tools
      llvm-vs-code-extensions.vscode-clangd
      vadimcn.vscode-lldb

      # Rust stuff
      rust-lang.rust-analyzer
    ];
    userSettings = {
      # VSCode settings
      "editor.formatOnSave" = true;
      "explorer.confirmDelete" = false;

      # Nix-IDE settings
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        nil.formatting.command = ["nix" "fmt" "--" "-"];
      };

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

      # Cmake stuff
      "cmake.showOptionsMovedNotification" = false;
      "cmake.options.statusBarVisibility" = "compact";
      "cmake.pinnedCommands" = [
        "workbench.action.tasks.configureTaskRunner"
        "workbench.action.tasks.runTask"
      ];
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
