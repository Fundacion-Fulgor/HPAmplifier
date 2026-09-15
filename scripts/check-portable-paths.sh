#!/bin/sh

set -eu

staged=false
for arg in "$@"; do
  case "$arg" in
    --staged) staged=true ;;
    *) printf 'usage: check-portable-paths.sh [--staged]\n' >&2; exit 2 ;;
  esac
done

# Match machine-specific Unix roots, Windows drive paths, and UNC shares.
# The leading boundaries avoid treating URLs and relative directories as roots.
path_boundary='(^|[[:space:]="'"'"'({[,]|[[:space:]]:)'
forbidden_paths="${path_boundary}/(home|Users|Volumes|mnt|media|workspace|workspaces|foss/designs|headless)(/[^[:space:]\"'<>]*)?($|[[:space:]\"'<>),;}])|${path_boundary}[[:alpha:]]:[/\\\\][^[:space:]\"'<>]*|${path_boundary}(//|\\\\\\\\)[^/\\\\[:space:]]+[/\\\\][^[:space:]\"'<>]+"

# Reports and old generated netlists retain tool provenance and are not inputs.
cached_flag=""
if "$staged"; then
  cached_flag="--cached"
fi

if matches=$(git grep $cached_flag -I -n -E "$forbidden_paths" -- . \
  ':(exclude)scripts/check-portable-paths.sh' \
  ':(exclude)tests/test_fix_xschem_paths.py' \
  ':(exclude)tests/test_check_portable_paths.py' \
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
