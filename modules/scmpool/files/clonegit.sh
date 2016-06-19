#!/bin/bash


cd /etc/puppetlabs/code/environments_new/

for branch in staging production
do 
if [[ -d $branch ]] 
then
cd $branch; git fetch --all; git reset --hard origin/$branch
cd /etc/puppetlabs/code/environments_new/
else
git clone git@github.com:devopstest0/puppetcode.git $branch --branch $branch
fi
done
