#!/bin/bash

git diff --name-only HEAD^ HEAD | grep recipes | cut -d/ -f2 | sort | uniq | while read line
do
    (cd "recipes/$line"; conda build .)
done
