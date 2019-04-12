FROM myarch-gnuradio:latest
MAINTAINER matthew.presti@gmail.com

# Already set python variables
# Python 3 Related Functions
# ENV PYTHONPATH /usr/lib/python3.7/site-packages
# I had this added to the PYTHONPATH before. /usr/lib/python3.7/site-packages/mako/
#ENV PYTHON_EXECUTABLE /usr/bin/python3
#RUN ln -f -s /usr/bin/python3.7 /root/scripts/python && \
#   alias python='/usr/bin/python3.7'
################################################################################
# END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON END-PYTHON # 
################################################################################


################################################################################
# QT SETUP
################################################################################
# For qt4
ENV QT_PLUGIN_PATH /usr/lib/qt4/plugins
# For qt5 - double check this setting below
#ENV QT_PLUGIN_PATH /usr/lib/qt/plugins



# set up X pulse server
RUN mkdir -p /etc/pulse
RUN echo "default-server = 172.17.0.1" >> /etc/pulse/client.conf


# Already set in previous version
#ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib:/usr/local/lib/libhackrf.so

RUN pacman -S --noconfirm --needed gnuradio-iqbal

#Install yay for AUR packages
RUN git clone https://aur.archlinux.org/soapysdr-git.git && \
 cd soapysdr-git && \
 chmod +x /usr/bin/makepkg && \
 makepkg -si --noconfirm

RUN unset LDFLAGS 
#ENV LDFLAGS -lpthread

RUN pacman -S --noconfirm --needed gnuradio-iqbal gnuradio-osmosdr cython qspectrumanalyzer gqrx xorg-xcalc

RUN git clone https://github.com/jopohl/urh/ && \
cd urh && \
python setup.py install

ENV LD_LIBRARY_PATH /usr/local/lib:/usr/lib:/var/lib:/usr/local/lib/libhackrf.so

# Do not change the below pacman parameters
RUN pacman -Sqyu --needed --noconfirm --needed openssh && \
    systemctl enable sshd

### configure ssh
RUN sed -i \
        -e 's/^#*\(PermitRootLogin\) .*/\1 yes/' \
        -e 's/^#*\(PasswordAuthentication\) .*/\1 yes/' \
        -e 's/^#*\(PermitEmptyPasswords\) .*/\1 yes/' \
        -e 's/^#*\(UsePAM\) .*/\1 no/' \
        /etc/ssh/sshd_config
 
ENV container docker
EXPOSE 22
CMD /usr/lib/systemd/systemd
