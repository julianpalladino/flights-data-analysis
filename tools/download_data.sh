#!/bin/bash
dir=data
mkdir -p $dir
for url in $(cat $dir/urls.txt)
do
    fn=$dir/$(basename $url)
    wget --continue $url -O $fn
done
