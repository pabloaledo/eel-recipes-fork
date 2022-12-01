#!/bin/bash

echo -e "\e[34m Available recipes \e[0m"
ls recipes

git diff --name-only HEAD^ HEAD | grep recipes | cut -d/ -f2 | sort | uniq | while read line
do
    echo -e "\e[34m Building recipe $line \e[0m"
    (cd "recipes/$line"; conda build .)
done
