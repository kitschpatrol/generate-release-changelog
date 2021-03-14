#!/bin/sh -l
# shellcheck disable=SC2039

if [ "$1" ] && [ "$1" != "package.json" ]; then
  cp "$1" package.json
fi

previous_tag=$(git tag --sort version:refname | tail -n 2 | head -n 1)
new_tag=$(git tag --sort version:refname | tail -n 1)
changelog=$(generate-changelog -t "$previous_tag..$new_tag" --file -)

changelog="${changelog//'%'/'%25'}"
changelog="${changelog//$'\n'/'%0A'}"
changelog="${changelog//$'\r'/'%0D'}"

echo "$changelog"

echo "::set-output name=changelog::$changelog"
