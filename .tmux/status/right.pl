#!/usr/local/bin/perl

use Env;
use Cwd;
use Unix::Uptime;
use POSIX;

$width = $ARGV[0];

$show_uptime = 1;
$show_ip = 1;

$sep = "│";

$seg_1_color = "#[fg=$TMUX_THEME_COLOR_SIXTH,bg=$TMUX_THEME_COLOR_FIFTH]";
$seg_2_color = "#[fg=$TMUX_THEME_COLOR_FOURTH,bg=$TMUX_THEME_COLOR_THIRD]";
$seg_3_color = "#[fg=$TMUX_THEME_COLOR_SECOND,bg=$TMUX_THEME_COLOR_FIRST]";

$seg_1_content = "";
$seg_2_content = "";
$seg_3_content = "";

if ($width > 100 and $show_uptime) {
  my $uptime = Unix::Uptime->uptime();
  my $days = floor($uptime / 86400);
  $uptime = $uptime - ($days * 86400);
  my $hours = floor($uptime / 3600) % 24;
  $uptime = $uptime - ($hours * 3600);
  my $minutes = floor($uptime / 60) % 60;
  $uptime = $uptime - ($minutes * 60);
  my $up = "$days:$hours:$minutes";

  $seg_1_content = "⚡︎ $up";
} else {
  $seg_1_content = "";
}

if ($width > 80 and $show_ip) {
  $ip_en0 = `ifconfig en0 | grep 'inet ' | awk '{print \$2}'`;
  $ip_en1 = `ifconfig en1 | grep 'inet ' | awk '{print \$2}'`;

  $ip_local = $ip_en0 . $ip_en1;
  $ip_local =~ s/^\s+|\s+$//g;

  $ip_global = `curl http://ipinfo.io/ip`;
  $ip_global =~ s/^\s+|\s+$//g;
  if (length ($ip_global) > 0) {
    $ip_global = "$sep $ip_global";
  }

  $ip_vpn = `ifconfig utun2 | grep 'inet ' | awk '{print \"$sep \" \$2}'`;
  $ip_vpn =~ s/^\s+|\s+$//g;

  if (length ($ip_local) > 0) {
    $seg_2_content .= " $ip_local";
  }
  else {
    $seg_2_content .= " offline";
  }
  if (length ($ip_global) > 0) {
    $seg_2_content .= " $ip_global";
  } else {
    $seg_2_content .= " $sep offline";
  }

  if (length ($ip_vpn) > 0) {
    $seg_2_content .= " $ip_vpn";
  }
} else {
  $seg_2_content = "";
}

$host = `hostname -f | awk -F'.' '{print \$1}'`;
$host =~ s/^\s+|\s+$//g;

$seg_3_content = "$host";

$seg_1 = "$seg_1_color $seg_1_content";
$seg_2 = "$seg_2_color $seg_2_content";
$seg_3 = "$seg_3_color $seg_3_content";

$status_right = "$seg_1 $seg_2 $seg_3 ";

print $status_right;
