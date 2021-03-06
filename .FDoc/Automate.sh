#!/bin/bash

sudo apt install -y doxygen #I hope GitHub Actions supports sudo

pip3 install jinja2
pip3 install pygments
git clone https://github.com/BlockProject3D/Framework

#Prepare Framework
#cp base.html Framework
#cp doxygen.py Framework
cp .FDoc/index.html Framework
cp .FDoc/Doxyfile .FDoc/DoxyfileMCSS Framework
cp .FDoc/logo.png .FDoc/logo_white.ico Framework
cd Framework
git clone https://github.com/mosra/m.css.git

#mv base.html ./m.css/documentation/templates/doxygen
#mv doxygen.py ./m.css/documentation
cd m.css/documentation && python3 doxygen.py ../../DoxyfileMCSS && cd ../../
mv index.html ./html
mv ./html ../
cd ..
rm -rf Framework
git fetch origin master
git checkout master
#git pull origin master
mv ./html/* ./
rmdir ./html
git config --local user.email "blockproject3d@outlook.com"
git config --local user.name "BlockProject-3D"
git add --all
git commit -am "Update documentation"
