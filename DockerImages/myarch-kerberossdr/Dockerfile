FROM myarch-gnuradio:latest
MAINTAINER matthew.presti@gmail.com
SHELL ["/bin/bash", "-c"] 

RUN pacman --noconfirm -Syu

################################################################################
# PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON PYTHON #
################################################################################
RUN mkdir -p /root/scripts
ENV PATH /root/scripts:/usr/bin:/bin:$PATH

# PYTHON VERSION SETUPS
# Python All - Not ready Dont Use
#RUN pacman -S python2 python3 python-numpy python2-pip python2-mako pygtk  python2-lxml python2-pyzmq python-wxpython python2-setuptools --noconfirm

# Python version 2 - uncomment the following
##RUN pacman -S python2 python2-pip python2-mako pygtk  python2-lxml python2-setuptools python2-numpy --noconfirm 


# Python version 3
RUN pacman -S --needed --noconfirm python3 python-numpy python-pip python-mako python-wxpython python-docutils python-setuptools 
# I removed python2-pyzmq from the above 3 list

# Python ENV variables - uncomment either python 2 or python 3 to select which version to use
# Python 2
#ENV PYTHONPATH /usr/lib/python2.7/site-packages:/usr/lib/python2.7/site-packages/mako/
#RUN ln -f -s /usr/bin/python2.7 /root/scripts/python && \
#alias python='/usr/bin/python2.7'


# Python 3 Related Functions
ENV PYTHONPATH /usr/lib/python3.7/site-packages
# I had this added to the PYTHONPATH before. /usr/lib/python3.7/site-packages/mako/
ENV PYTHON_EXECUTABLE /usr/bin/python3
RUN ln -f -s /usr/bin/python3.7 /root/scripts/python && \
   alias python='/usr/bin/python3.7'

RUN pacman -R --noconfirm python-numpy && \
	pacman -S --noconfirm --needed python-qtpy python-setuptools libusb



RUN pip install PyYAML pygobject PyGObject matplotlib scipy cairocffi pyapril pyargus pyqtgraph peakutils bottle paste

################################################################################
# END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON # 
################################################################################

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-kerberos && \
	cd rtl-sdr-kerberos && \
	mkdir build && \
	cd build && \
	cmake ../ -DINSTALL_UDEV_RULES=ON && \
	make && \
	make install && \
	cp ../rtl-sdr.rules /etc/udev/rules.d/ && \
	ldconfig && \
	echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf


