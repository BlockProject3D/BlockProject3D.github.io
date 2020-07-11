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
git checkout DocUpdate #Warning remove after release 3.0
git clone https://github.com/mosra/m.css.git

#mv base.html ./m.css/documentation/templates/doxygen
#mv doxygen.py ./m.css/documentation
cd m.css/documentation && python3 doxygen.py ../../DoxyfileMCSS && cd ../../
mv index.html ./html
mv -r .html/* ../
cd ..
rm -rf Framework
git config --local user.email "blockproject3d@github.com"
git config --local user.name "B"
git commit -am "Update documentation"
