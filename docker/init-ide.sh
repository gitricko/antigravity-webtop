#!/bin/bash
source /custom-cont-init.d/common.sh || exit 1

SRC="/custom-cont-init.d/Antigravity.desktop"
sync_desktop_file "$SRC" "/config/Desktop/Antigravity.desktop"

SRC="/custom-cont-init.d/Codex.desktop"
sync_desktop_file "$SRC" "/config/Desktop/Codex.desktop"
