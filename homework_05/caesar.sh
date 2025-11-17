#!/bin/bash

rotation=${1:-13}

rot=$((rotation % 26))

lower="abcdefghijklmnopqrstuvwxyz"
upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

lower_rotated="${lower:$rot}${lower:0:$rot}"
upper_rotated="${upper:$rot}${upper:0:$rot}"

tr "${lower}${upper}" "${lower_rotated}${upper_rotated}"
