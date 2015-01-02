#!/bin/bash

cd "$HOME"
git clone --branch=master https://${GITHUB_TOKEN}@github.com/OpenRA/openra.github.io openra.net || exit 1

cd openra.net || exit 1
cp -rf "$TRAVIS_BUILD_DIR"/output/* . || exit 1
git config --local user.email "orabot@users.noreply.github.com"
git config --local user.name "orabot"
git add *
git commit -m "Deploy OpenRAWeb HTML to GitHub pages

commit: OpenRA/OpenRAWeb@$TRAVIS_COMMIT"
git push --quiet origin master &> /dev/null
