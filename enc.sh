#!/usr/bin/env bash

########################################
# Encodes the input using calculator spelling.
# Calculator spelling is an unintended characteristic of the seven-segments
# display traditionally used by calculators, in which, when read upside-down,
# the digits resemble letters of the Latin alphabet. Each digit may be mapped
# to one or more letters, creating a limited but functional subset of the
# alphabet, sometimes referred to as beghilos (or beghilosz).
# Arguments:
#   $1: Text to encode.
# Outputs:
#   To the stdout beghilosz encoded text.
########################################
beghilosz() {
  local text=$1
  echo -n "${text}" \
    | tr '[:lower:]' '[:upper:]' \
    | tr 'BEGHILOSZ' '836417052' \
    | rev \
    | tac
}

set -euo pipefail
beghilosz "$@"
