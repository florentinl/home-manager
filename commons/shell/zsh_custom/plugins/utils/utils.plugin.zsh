# Copy/Paste aliases
alias copy="clipcopy"
alias paste="clippaste"
function copy_and_echo {
  echo $1 | tr -d '\n' | copy
  echo "\033[31m$1\033[0m has been added to your clipboard !"
}

# Open files with specific extensions
alias -s {yaml,yml}=nvim
alias -s conf=nvim

# Miscellanous
alias sudo="sudo "
alias watch="watch "
alias paste64="paste | base64 -d"
alias copy64="base64 | copy"
alias p8="ping 8.8.8.8 -a"
alias plz='sudo $(fc -ln -1)'
alias rmf='rm -rf'
alias gsq='git reset --soft HEAD~1 && git commit --amend -C HEAD' # Squash last two commits
alias cwd='printf '%s' '$PWD' | copy'
alias cpk='for public_key in ~/.ssh/*.pub; do cat $public_key | tr -d "\n" | copy; break; done;'
alias zpl='omz plugin load'
alias zpe='omz plugin enable'
alias zpd='omz plugin disable'

# .zshrc and plugin related alias
alias reload='source ~/.zshrc'
