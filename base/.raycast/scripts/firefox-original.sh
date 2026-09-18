#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Focus Firefox Original
# @raycast.mode silent
# @raycast.packageName Firefox Profiles
set -euo pipefail
pid=$(/usr/sbin/lsof -t "$HOME/Library/Application Support/Firefox/Profiles/to65ryds.default-release/.parentlock") || { echo 'Firefox Original is not running'; exit 1; }
/usr/bin/osascript -l JavaScript -e 'ObjC.import("AppKit"); function run(args) { const app = $.NSRunningApplication.runningApplicationWithProcessIdentifier(Number(args[0])); if (!app || !app.activateWithOptions(2)) throw Error("Could not focus Firefox"); }' "$pid"
