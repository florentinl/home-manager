{ pkgs, ... }:
{
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

      pkief.material-icon-theme

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
      "editor.smoothScrolling" = true;
      "editor.cursorSurroundingLines" = 10;
      "editor.cursorSurroundingLinesStyle" = "all";

      # Nix-IDE settings
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        nil.formatting.command = [
          "nix"
          "fmt"
          "--"
          "-"
        ];
      };

      # Set font to CaskaydiaCove Nerd Font
      "editor.fontFamily" = "CaskaydiaCove Nerd Font";
      "editor.fontLigatures" = true;
      "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font";

      # Trim trailing whitespace and lines
      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;

      # Visual settings
      "window.titleBarStyle" = "native";
      "window.commandCenter" = true;
      "window.menuBarVisibility" = "toggle";
      "window.autoDetectColorScheme" = true;
      "workbench.layoutControl.enabled" = false;
      "workbench.tree.indent" = 12;
      "workbench.sideBar.location" = "right";
      "workbench.iconTheme" = "material-icon-theme";

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

      # VSCodeVim settings
      "vim.handleKeys" = {
        "<C-p>" = false;
        "<C-k>" = false;
        "<C-w>" = false;
      };

      # Use jk to exit insert mode
      "vim.insertModeKeyBindings" = [
        {
          "before" = [
            "j"
            "k"
          ];
          "after" = [ "<Esc>" ];
        }
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
      {
        key = "ctrl+e";
        command = "workbench.action.closeSidebar";
        when = "sideBarFocus";
      }

      # Pane navigation with Super+hjkl
      {
        key = "ctrl+alt+h";
        command = "workbench.action.focusLeftGroup";
      }
      {
        key = "ctrl+alt+j";
        command = "workbench.action.focusBelowGroup";
      }
      {
        key = "ctrl+alt+k";
        command = "workbench.action.focusAboveGroup";
      }
      {
        key = "ctrl+alt+l";
        command = "workbench.action.focusRightGroup";
      }

      # Split vertical/horizontal with Super+v/h
      {
        key = "ctrl+k v";
        command = "workbench.action.splitEditorRight";
      }

      # Move Editor into group with
      {
        key = "ctrl+k h";
        command = "workbench.action.moveEditorToLeftGroup";
      }
      {
        key = "ctrl+k l";
        command = "workbench.action.moveEditorToRightGroup";
      }

      # Git Hunk navigation
      {
        key = "ctrl+k g";
        command = "editor.action.dirtydiff.next";
        when = "editorTextFocus && !textCompareEditorActive";
      }

      # Git
      {
        key = "ctrl+k a";
        command = "git.stageSelectedRanges";
      }
      {
        key = "ctrl+k b";
        command = "git.unstageSelectedRanges";
      }
    ];
  };
}
