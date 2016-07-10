set fish_greeting

set -x vi nvim
set -x vim nvim
set -x EDITOR nvim
set -x GREP_COLOR "1;37;45"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Git
source {$HOME}/.config/fish/git.fish
