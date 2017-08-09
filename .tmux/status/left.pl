#!/usr/local/bin/perl

use Env;

$seg_1_color = "#[fg=$TMUX_THEME_COLOR_SECOND,bg=$TMUX_THEME_COLOR_FIRST]";
$seg_2_color = "#[fg=$TMUX_THEME_COLOR_FOURTH,bg=$TMUX_THEME_COLOR_THIRD]";
$seg_3_color = "#[fg=$TMUX_THEME_COLOR_THIRD,bg=$TMUX_THEME_COLOR_FIFTH]";

$seg_1_content = "#S";
$seg_2_content = "#{?client_prefix,#[fg=$TMUX_THEME_COLOR_SIXTH]•,#[fg=$TMUX_THEME_COLOR_FIFTH]•}";
$seg_3_content = "";

$status_left = "$seg_1_color $seg_1_content $seg_2_color $seg_2_content $seg_3_color $seg_3_content ";

print $status_left;
