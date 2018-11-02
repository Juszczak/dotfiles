#!/usr/bin/env bash

declare global; global="$(dig +short myip.opendns.com @resolver1.opendns.com)";
declare local; local="$(ifconfig | grep 'inet ' | grep broadcast | awk '{print $2}' | paste -sd " " -)";
declare out; out="$global │ $local"

echo "$out"
