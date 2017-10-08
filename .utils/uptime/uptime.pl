#!/usr/local/bin/perl

use Unix::Uptime;
use POSIX;

my $uptime = Unix::Uptime->uptime();
my $days = floor($uptime / 86400);
$uptime = $uptime - ($days * 86400);
my $hours = floor($uptime / 3600) % 24;
$uptime = $uptime - ($hours * 3600);
my $minutes = floor($uptime / 60) % 60;
$uptime = $uptime - ($minutes * 60);
my $up = "$days:$hours:$minutes";

print "$up";
