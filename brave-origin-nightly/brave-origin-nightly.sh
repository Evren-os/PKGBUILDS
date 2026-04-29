#!/usr/bin/env bash
export CHROME_DESKTOP=brave-origin-nightly.desktop
flags_file="${XDG_CONFIG_HOME:-${HOME}/.config}/brave-origin-nightly-flags.conf"
declare -a user_flags=()
if [[ -f "${flags_file}" ]]; then
    mapfile -t user_flags < <(grep -Ev '^\s*(#|$)' "${flags_file}")
fi
exec /opt/brave-origin-nightly/brave --class=brave-origin-nightly "${user_flags[@]}" "$@"