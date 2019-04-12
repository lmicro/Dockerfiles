
MAINTAINER matthew.presti@gmail.com
RUN pacman -Syu --noconfirm
RUN pacman -Rc --noconfirm qt5-base qt5-svg

# Already set python variables
# Python 3 Related Functions
# Python settings
RUN pacman -S --needed --noconfirm qt4 python2 python2-pip python2-mako pygtk  python2-lxml python2-setuptools python2-numpy python2-cheetah python2-qtpy python2-scapy python2-scipy
ENV PYTHONPATH /usr/lib/python2.7/site-packages
ENV PYTHON_EXECUTABLE=/usr/bin/python2
RUN ln -f -s /usr/bin/python2.7 /root/scripts/python && \
    alias python='/usr/bin/python2.7'

################################################################################
# END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON # 
################################################################################
ENV QT_SELECT=4
#RUN ln -s /usr/lib/qt4/bin/qmake /usr/bin/qmake
#RUN ls -l /usr/bin/qmake /usr/lib/qt4/bin/qmake

# Already set in previous version
#ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib

RUN pacman -S --noconfirm --needed gnuradio-iqbal python2-sip
#RUN pacman -S --noconfirm --needed gnuradio-iqbal sip python2-sip

RUN pip2 install PyBOMBS 
RUN pip2 install dbus-python 
RUN pybombs -vv recipes add-defaults
RUN pybombs -vv config default_prefix default_prx
#RUN pybombs -vv install gr-gsm


#Install yay for AUR packages
#RUN git clone https://aur.archlinux.org/soapysdr-git.git && \
# cd soapysdr-git && \
# makepkg -si --noconfirm

RUN unset LDFLAGS 
#ENV LDFLAGS -lpthread

RUN pacman -S --noconfirm --needed gnuradio-iqbal

#RUN git clone https://github.com/osmocom/gr-osmosdr && \
#    cd gr-osmosdr && \
#    mkdir build && \
#    cd build/ && \
#    cmake -DPYTHON_EXECUTABLE=/usr/bin/python3 ../ && \
#    make && \
#    make install && \
#    ldconfig

#RUN pacman -S --noconfirm --needed gnuradio-osmosdr cython qspectrumanalyzer gqrx

RUN git clone https://github.com/jopohl/urh/ && \
cd urh && \
python setup.py install


#RUN pacman -Syu --noconfirm

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib
#:/usr/local/lib/libhackrf.so

RUN git clone git clone https://github.com/Oros42/IMSI-catcher.git 

#RUN pacman -S --needed --noconfirm python2-cheetah talloc pcsclite

#RUN git clone git://git.osmocom.org/libosmocore.git && \
#    cd libosmocore/ && \
#    autoreconf -i && \
#    ./configure && \
#    make && \
#    make install && \
#    ldconfig -i 

#RUN git clone https://git.osmocom.org/gr-gsm && \
#    cd gr-gsm && \
#    mkdir build && \
#    cd build && \
#    cmake .. && \
#    mkdir $HOME/.grc_gnuradio/ $HOME/.gnuradio && \
#    #make -j 7 && \ 
#    make && \ 
#    make install && \
#    ldconfig 

#RUN pacman -Sqyu --needed --noconfirm --needed openssh && \
#    systemctl enable sshd
#
## configure ssh
#RUN sed -i \
#        -e 's/^#*\(PermitRootLogin\) .*/\1 yes/' \
#        -e 's/^#*\(PasswordAuthentication\) .*/\1 yes/' \
#        -e 's/^#*\(PermitEmptyPasswords\) .*/\1 yes/' \
#        -e 's/^#*\(UsePAM\) .*/\1 no/' \
#        /etc/ssh/sshd_config
# 
#ENV container docker
#EXPOSE 22
#CMD /usr/lib/systemd/systemd
