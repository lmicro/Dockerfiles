FROM myarch-rfapps:latest
MAINTAINER matthew.presti@gmail.com
RUN pacman -Syu --noconfirm
#RUN pacman -Rc --noconfirm qt5-base qt5-svg

# Already set python variables
# Python 3 Related Functions
# Python settings
RUN pacman -S --needed --noconfirm qt4 python2 python2-pip python2-mako pygtk  python2-lxml python2-setuptools python2-numpy python2-cheetah python2-qtpy
ENV PYTHONPATH /usr/lib/python2.7/site-packages
ENV PYTHON_EXECUTABLE=/usr/bin/python2
RUN mkdir -p /root/scripts && \
	ln -f -s /usr/bin/python2.7 /root/scripts/python && \
	alias python='/usr/bin/python2.7'


RUN pacman -S --noconfirm --needed gnuradio-iqbal sip python2-sip

RUN pip2 install  libusb NumPy
#RUN pip2 install dbus-python 

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib



RUN git clone https://github.com/dressel/pyhackrf 
	#cp -pr pyhackrf /usr/lib/python2.7/site-packages
