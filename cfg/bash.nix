{ config, lib, pkgs, ... }:

{
  # This is here because usually you set this in the bashrc per-user, so I'll probably look for it in bash configs next time i need to make a change
  programs.bash = {
    #enableLsColors = true;
    #enableCompletion = true;
    shellInit = ''
    PATH=$PATH:/home/brody/minecraft
    '';
    promptInit = ''
      PATH=$PATH:/home/brody/minecraft    
      shopt -s histappend
      HISTCONTROL=ignoreboth
      HISTSIZE=10000
      HISTFILESIZE=20000
      shopt -s checkwinsize
      function chownd(){
        local topDir="''${1}"
        local chmodArgs="''${2}"
        #if [[ -n "''${1}" ]] | [[ -n "''${2}" ]] | [[ "''${!@}" -gt 2 ]]
        if ! [[ "''${@}" -eq 2 ]]
        then
          printf '\n\nRemember to quote args.
	  \nCommand is:
	  \nfind "''${1}" -type d -print0 | xargs -0 chmod "''${2}"\n\n'
	  return 1
        fi
        find "''${1}" -type d -print0 | xargs -0 chmod "''${2}"
      }
      # Provide a nice prompt if the terminal supports it.
      if [ "$TERM" != "dumb" -o -n "$INSIDE_EMACS" ]; then
        PROMPT_COLOR="1;31m"
        let $UID && PROMPT_COLOR="1;32m"
	
        if [ -n "$INSIDE_EMACS" -o "$TERM" == "eterm" -o "$TERM" == "eterm-color" ]; then
          # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
          PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
        else
          PS1="\n\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
        fi

        if test "$TERM" = "xterm"; then
          PS1="\[\033]2;\h:\u:\w\007\]$PS1"
        fi
    fi
    '';
  };
}