#!/bin/bash

catppuccin_black="#24273a"
catppuccin_blue="#8aadf4"
catppuccin_yellow="#eed49f"
catppuccin_red="#ed8796"
catppuccin_white="#cad3f5"
catppuccin_mouse="#c6a0f6"
catppuccin_visual_grey="#363a4f"
catppuccin_comment_grey="#6e738d"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$catppuccin_white"
set "message-bg" "$catppuccin_black"

set "message-command-fg" "$catppuccin_white"
set "message-command-bg" "$catppuccin_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$catppuccin_black"
setw "window-status-bg" "$catppuccin_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$catppuccin_black"
setw "window-status-activity-fg" "$catppuccin_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$catppuccin_comment_grey"
set "window-active-style" "fg=$catppuccin_white"

set "pane-border-fg" "$catppuccin_white"
set "pane-border-bg" "$catppuccin_black"
set "pane-active-border-fg" "$catppuccin_mouse"
set "pane-active-border-bg" "$catppuccin_black"

set "display-panes-active-colour" "$catppuccin_yellow"
set "display-panes-colour" "$catppuccin_blue"

set "status-bg" "$catppuccin_black"
set "status-fg" "$catppuccin_white"

set "@prefix_highlight_fg" "$catppuccin_black"
set "@prefix_highlight_bg" "$catppuccin_mouse"
set "@prefix_highlight_copy_mode_attr" "fg=$catppuccin_black,bg=$catppuccin_mouse"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@catppuccin_widgets")
time_format=$(get "@catppuccin_time_format" "%R")
date_format=$(get "@catppuccin_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$catppuccin_white,bg=$catppuccin_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$catppuccin_visual_grey,bg=$catppuccin_black]"
set "status-left" "#[fg=$catppuccin_black,bg=$catppuccin_mouse,bold] #S #{prefix_highlight}#[fg=$catppuccin_mouse,bg=$catppuccin_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$catppuccin_black,bg=$catppuccin_black,nobold,nounderscore,noitalics]#[fg=$catppuccin_white,bg=$catppuccin_black] #I  #W #[fg=$catppuccin_black,bg=$catppuccin_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$catppuccin_black,bg=$catppuccin_visual_grey,nobold,nounderscore,noitalics]#[fg=$catppuccin_white,bg=$catppuccin_visual_grey,nobold] #I  #W #[fg=$catppuccin_visual_grey,bg=$catppuccin_black,nobold,nounderscore,noitalics]"
