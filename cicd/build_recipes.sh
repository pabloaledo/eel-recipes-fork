#!/bin/bash

setup_conda(){
    echo -e "\e[34m Setup conda \e[0m"
    (
    curl -O https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-$(arch).sh
    bash ./Anaconda3-2022.10-Linux-$(arch).sh -b -p $HOME/anaconda3

    echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc

    ~/anaconda3/bin/conda config --system --add channels defaults
    ~/anaconda3/bin/conda config --system --add channels conda-forge
    )
}

build_recipe(){
    echo -e "\e[34m Building recipe $line \e[0m"
    (cd "recipes/$1"; ~/anaconda3/bin/conda build .)
}


[ -e ~/anaconda3 ] || setup_conda

build_recipe star

# create key at https://anaconda.org/<user>/settings/access and put in the env_variable ANACONDA_API_TOKEN
~/anaconda3/bin/anaconda upload --user seqera linux-aarch64/*.tar.bz2

#git diff --name-only HEAD^ HEAD | grep '^recipes/' | cut -d/ -f2 | sort | uniq | while read line
#do
    #build_recipe "$line"
#done
