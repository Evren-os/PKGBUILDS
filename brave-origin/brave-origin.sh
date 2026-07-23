#!/usr/bin/env bash
export CHROME_DESKTOP=brave-origin.desktop
flags_file="${XDG_CONFIG_HOME:-${HOME}/.config}/brave-origin-flags.conf"
declare -a user_flags=()
if [[ -f "${flags_file}" ]]; then
    mapfile -t user_flags < <(grep -Ev '^\s*(#|$)' "${flags_file}")
fi
exec /opt/brave-origin/brave --class=brave-origin "${user_flags[@]}" "$@"