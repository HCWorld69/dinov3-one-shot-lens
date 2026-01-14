#!/usr/bin/env bash
set -euo pipefail

cmd="${1:-help}"

case "$cmd" in
  get)
    flutter pub get
    ;;
  format)
    dart format lib test
    ;;
  analyze)
    flutter analyze
    ;;
  test)
    flutter test
    ;;
  run)
    flutter run
    ;;
  ci)
    dart format --set-exit-if-changed lib test
    flutter analyze
    flutter test
    ;;
  *)
    echo "Usage: tool/dev.sh {get|format|analyze|test|run|ci}"
    exit 1
    ;;
esac
