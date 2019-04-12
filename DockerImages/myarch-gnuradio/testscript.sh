#!/bin/bash
#export PYVER=2
echo "pyver: $PYVER"

if [[ $PYVER != 2 ]] ; then echo " --build-arg PYVER=2 was not supplied, using PYTHON3"  && pacman -S --needed --noconfirm python3 python-numpy python-pip python-mako python-wxpython python-docutils python-setuptools  && ln -f -s /usr/bin/python3.7 /root/scripts/python &&  alias python='/usr/bin/python3.7' ;  else  echo " --build-arg PYVER=2 was set, using PYTHON2" && pacman -Q python2 python2-pip python2-mako pygtk python2-lxml python2-setuptools python2-numpy --noconfirm;  fi  


#   else && \
#	echo " --build-arg PYVER=2 was set, using PYTHON2" && \
#        RUN pacman -S python2 python2-pip python2-mako pygtk  python2-lxml python2-setuptools python2-numpy --noconfirm  && \
#        ln -f -s /usr/bin/python2.7 /root/scripts/python && \
#        alias python='/usr/bin/python2.7' && \
#  fi


