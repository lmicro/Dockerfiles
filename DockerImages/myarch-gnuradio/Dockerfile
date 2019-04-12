FROM myarch-base:latest
MAINTAINER matthew.presti@gmail.com
SHELL ["/bin/bash", "-c"] 

RUN pacman --noconfirm -Syu
ENV PATH /root/scripts:/usr/bin:/bin:$PATH

################################################################################
# PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON #
################################################################################

# Python 3 Related Functions by Default
#ENV PYTHONPATH /usr/lib/python3.7/site-packages
#ENV PYTHON_EXECUTABLE /usr/bin/python3

ARG PYTHONPATH
ARG PYTHON_EXECUTABLE

# if --build-arg USEPYTHON2=2, set NODE_ENV to 'development' or set to null otherwise.
#ENV PYTHONPATH=${USEPYTHON2:+/usr/lib/python2.7/site-packages:/usr/lib/python2.7/site-packages}
#ENV PYTHON_EXECUTABLE=${USEPYTHON2:+/usr/bin/python2}
# if NODE_ENV is null, set it to 'production' (or leave as is otherwise).

RUN echo "PYTHONPATH=$PYTHONPATH PYTHON_EXECUTABLE=$PYTHON_EXECUTABLE"

RUN if [[ $PYTHON_EXECUTABLE == "/usr/bin/python3"  ]] ; then echo "PYTHON_EXECUTABLE set to $PYTHON_EXECUTABLE"  && pacman -S --needed --noconfirm python3 python-numpy python-pip python-mako python-wxpython python-docutils python-setuptools  && ln -f -s /usr/bin/python3.7 /root/scripts/python &&  alias python='/usr/bin/python3.7' ;  else  echo "PYTHON_EXECUTABLE set to $PYTHON_EXECUTABLE - INSTALLING PYTHON2" && pacman -S python2 python2-pip python2-mako pygtk python2-lxml python2-setuptools python2-numpy --noconfirm && ln -f -s /usr/bin/python2.7 /root/scripts/python && alias python='/usr/bin/python2.7' ;  fi  



# PYTHON VERSION SETUPS
# Python All - Not ready Dont Use
#RUN pacman -S python2 python3 python-numpy python2-pip python2-mako pygtk  python2-lxml python2-pyzmq python-wxpython python2-setuptools --noconfirm

# Python version 2 - uncomment the following
##RUN pacman -S python2 python2-pip python2-mako pygtk  python2-lxml python2-setuptools python2-numpy --noconfirm 

# Python version 3
#RUN pacman -S --needed --noconfirm python3 python-numpy python-pip python-mako python-wxpython python-docutils python-setuptools 

# Python ENV variables - uncomment either python 2 or python 3 to select which version to use
# Python 2
#ENV PYTHONPATH /usr/lib/python2.7/site-packages:/usr/lib/python2.7/site-packages/mako/
#RUN ln -f -s /usr/bin/python2.7 /root/scripts/python && \
#alias python='/usr/bin/python2.7'



################################################################################
# END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON # 
################################################################################

#RUN  mv -f /usr/lib/python2.7 /usr/lib/python2.7-DONTUSE  2>/dev/null; true
ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib
#:/usr/local/lib/libhackrf.so



RUN git clone https://github.com/gnuradio/volk && \
    cd volk && \
    mkdir -p build && \
    cd build && \
    cmake -DPYTHON_EXECUTABLE=/usr/bin/python3 .. && \
    make && \
    make install && \
    ldconfig

ADD hackrf hackrf
RUN mkdir -p hackrf/host/build && \ 
    cd hackrf/host/build && \
    cmake .. && \
    make && \
    make install

ENV LDFLAGS -lpthread

RUN pacman -S --noconfirm --needed jack gsl thrift gobject-introspection graphviz
RUN pacman -R --noconfirm libvolk 
RUN pip install PyYAML pygobject PyGObject 

#RUN mkdir -p /WORKDIR
#WORKDIR /WORKDIR

RUN git clone --recursive https://github.com/gnuradio/gnuradio.git && \
    cd gnuradio && \
     mkdir build && \
     cd build && \
     cmake -DENABLE_GRC=ON -DENABLE_INTERNAL_VOLK=OFF -DPYTHON_EXECUTABLE=/usr/bin/python3 .. && \
     make install && \
     ldconfig


##RUN pacman -S --noconfirm --needed gnuradio-iqbal

##RUN git clone https://github.com/osmocom/gr-osmosdr && \
##    cd gr-osmosdr && \
##    mkdir build && \
##    cd build/ && \
##    cmake -DPYTHON_EXECUTABLE=/usr/bin/python3 ../ && \
##    make && \
###    make install && \
##    ldconfig
#ADD hackrf-scripts hackrf-scripts
