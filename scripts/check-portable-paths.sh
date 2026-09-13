#!/bin/sh

set -eu

# Match machine-specific Unix roots, Windows drive paths, and UNC shares.
# The leading boundaries avoid treating URLs and relative directories as roots.
path_boundary='(^|[[:space:]="'"'"'({[,]|[[:space:]]:)'
forbidden_paths="${path_boundary}/(home|Users|Volumes|mnt|media|workspace|workspaces|foss/designs|headless)(/[^[:space:]\"'<>]*)?($|[[:space:]\"'<>),;}])|${path_boundary}[[:alpha:]]:[/\\\\][^[:space:]\"'<>]*|${path_boundary}(//|\\\\\\\\)[^/\\\\[:space:]]+[/\\\\][^[:space:]\"'<>]+"

# Reports and old generated netlists retain tool provenance and are not inputs.
if matches=$(git grep -I -n -E "$forbidden_paths" -- . \
  ':(exclude)scripts/check-portable-paths.sh' \
  ':(exclude,glob)**/*.lyrdb' \
  ':(exclude,glob)**/*.log' \
  ':(exclude,glob)**/*.raw' \
  ':(exclude,glob)OTA_Telescopic_backup/OTA_Telescopic_v0/simulations/*.spice'); then
  :
else
  status=$?
  [ "$status" -eq 1 ] || exit "$status"
fi

if [ -n "$matches" ]; then
  printf '%s\n' 'Non-portable absolute paths found in tracked files:' "$matches" >&2
  exit 1
fi

printf '%s\n' 'No non-portable absolute paths found.'
