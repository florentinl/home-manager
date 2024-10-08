{ pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      palette = "custom";
      add_newline = false;
      format = lib.concatStrings [
        "[╭─](fg:line)[ ](bg:bg)$os"
        "([ ](fg:separator bg:bg)$directory)"
        "([ ](fg:separator bg:bg)\${custom.git_symbol}$git_branch$git_commit$git_state$git_status)"
        "[](fg:bg)$fill[](fg:bg)"
        "$status"
        "([│ ](fg:separator bg:bg)$python)"
        "([│ ](fg:separator bg:bg)$aws)"
        "([│ ](fg:separator bg:bg)$kubernetes)"
        "[─╮](fg:line)\n"
        "[╰─](fg:line)$sudo$character"
      ];
      right_format = "[─╯](fg:line)";
      palettes = {
        custom = {
          bg = "#1c1c1c";
          fg = "#eeeee7";
          line = "#444444";
          separator = "#303030";
          aws = "#ff9900";
          kubernetes = "#326ce5";
          python = "#ffde57";
        };
      };
      character = {
        format = " ";
      };
      fill = {
        symbol = " ";
      };
      os = {
        disabled = false;
        format = "[$symbol](fg:fg bg:bg)";
        symbols = {
          Alpine = " ";
          Ubuntu = "󰕈 ";
          Debian = " ";
          Macos = " ";
          Windows = " ";
          NixOS = " ";
        };
      };
      directory = {
        format = "[  $path]($style)[$read_only]($read_only_style)";
        style = "fg:cyan bg:bg";
      };
      custom = {
        git_symbol = {
          disabled = false;
          format = "[$output  ]($style)";
          style = "fg:green bg:bg";
          require_repo = true;
          when = "true";
          os = "linux";
          command = "remote=$(git remote -v); if echo $remote | grep -q 'github'; then echo ''; elif echo $remote | grep -q 'gitlab'; then echo ''; else echo ''; fi";
        };
      };
      git_branch = {
        format = "[$symbol$branch ]($style)[$compare]($compare_style)";
        symbol = "";
        style = "fg:green bg:bg";
        truncation_length = 10;
      };
      git_commit = {
        format = "[\($hash$tag\) ]($style)";
        style = "fg:green bg:bg";
      };
      git_state = {
        style = "fg:red bg:bg";
        format = "[$state( $progress_current/$progress_total) ]($style)";
        merge = "merge";
        rebase = "rebase";
        revert = "revert";
        bisect = "bisect";
        cherry_pick = "cherry-pick";
        am = "apply-mailbox";
        am_or_rebase = "apply-mailbox/rebase";
      };
      git_status = {
        format = "$all_status$ahead_behind";
        untracked = "[?$count ](fg:cyan bg:bg)";
        stashed = "[*$count ](fg:green bg:bg)";
        modified = "[!$count ](fg:yellow bg:bg)";
        staged = "[+$count ](fg:yellow bg:bg)";
        renamed = "[~$count ](fg:yellow bg:bg)";
        deleted = "[-$count ](fg:red bg:bg)";
      };
      aws = {
        style = "fg:aws bg:bg";
        symbol = "  ";
        format = "[$symbol$profile ]($style)";
      };
      kubernetes = {
        disabled = false;
        style = "fg:kubernetes bg:bg";
        symbol = "󱃾  ";
        format = "[$symbol$context( \($namespace\))]($style)";
      };
      python = {
        style = "fg:python bg:bg";
        symbol = " ";
        format = "([$symbol$virtualenv]($style))";
      };
      status = {
        disabled = false;
        style = "bg:bg";
        format = "[$symbol$maybe_int ]($style)";
        success_symbol = "[](fg:green bg:bg)";
        map_symbol = true;
      };
    };
  };
  home.packages = with pkgs; [ iconv ];
}
