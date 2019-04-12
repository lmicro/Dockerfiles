FROM archlinux/base
MAINTAINER matthew.presti@gmail.com

RUN mkdir /WORKDIR
WORKDIR /WORKDIR

#fix this at some point
#RUN pacman -Sy archlinux-keyring && pacman -Su --noconfirm

# UPDATE PACKAGES
RUN pacman -Syyu --noconfirm

# Install Base Devel packages without the group overhead.
RUN pacman -Syyu --needed --noconfirm autoconf automake binutils bison file findutils flex gawk gcc grep groff gzip libtool m4 make pacman patch pkgconf sed sudo systemd texinfo util-linux which go fakeroot fftw libusb git wget cmake mako mlocate vi libvolk cppunit swig doxygen boost boost-libs tensorflow log4cpp  doxygen doxygen-docs zeromq banner
# removed qt4 and qwt from above


# Install all other applications that are necessary
#RUN pacman -S --needed --noconfirm fftw libusb git wget cmake mako mlocate vi libvolk cppunit swig doxygen boost boost-libs tensorflow log4cpp  doxygen doxygen-docs zeromq qt4 qwt 

# Install ROOT version of makepkg for the sole purpose of installing AUR
ADD makepkg /usr/bin/makepkg

# Install AUR user dependencies  Note: remove the builduser after docker is done
RUN useradd builduser -m && \
	passwd -d builduser  && \
	printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers # Allow the builduser passwordless sudo 

	# In order to use AUR with above account do the following
	#sudo -u builduser bash -c 'cd ~ && git clone https://some-pkgbuild.git some-pkgbuild && cd some-pkgbuild && makepkg -s --noconfirm' # Clone and build a package

#Install yay for AUR packages
RUN git clone https://aur.archlinux.org/yay.git && \
	cd yay && \
	makepkg -si --noconfirm

# Set ENV values
ENV LD_LIBRARY_PATH /usr/lib:/var/lib:/usr/local/lib:$LD_LIBRARY_PATH 
ENV PATH /root/scripts:$PATH
#RUN echo "SET LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
#RUN echo "SET PATH: $PATH"

#RUN git clone --recursive https://github.com/gnuradio/gnuradio.git && \
#     cd gnuradio && \
#     mkdir build && \
#     cd build && \
#     cmake .. && \
#     make install && \
#     ldconfig

# While we're at it lets add lmicro to the list
RUN useradd lmicro -m && \
	passwd -d lmicro && \
	printf 'lmicro ALL=(ALL) ALL\n' | tee -a /etc/sudoers && \
	groupadd wireshark && \
	usermod -a -G wireshark lmicro && \
	passwd -d lmicro && \
	mkdir -p /root/scripts /home/lmicro/scripts

# Install QT5 by default
RUN pacman -S --needed --noconfirm qt5-base
ENV QT_SELECT=5
ADD BASHRC /root/.bashrc
ADD BASHRC /home/lmicro/.bashrc

