SHELL := /usr/bin/env bash

.PHONY: get format analyze test run ci

get:
	flutter pub get

format:
	dart format lib test

analyze:
	flutter analyze

test:
	flutter test

run:
	flutter run

ci:
	dart format --set-exit-if-changed lib test
	flutter analyze
	flutter test
