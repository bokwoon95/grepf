#!/usr/bin/env bash

mkdir -p test; cd test
mkdir 1 2 3
touch a.txt b.txt c.txt d.md e.md f.md
echo "hehe" | tee a.txt b.txt c.txt d.md e.md f.md
touch .gitignore && printf "*\n*/\n!.gitignore" >> .gitignore
mv a.txt b.txt 1; mv c.txt d.md 2; mv e.md f.md 3
cd ..
cp -r "test" "best"
