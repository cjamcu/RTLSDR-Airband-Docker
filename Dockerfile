FROM debian:latest

ARG rtl_airband_version=4.0.3

# Global dependency
RUN apt-get update && apt-get install -y usbip hwdata usbutils

# Install dependencies
RUN apt-get update && apt-get full-upgrade -y
RUN apt-get install -y build-essential cmake pkg-config libmp3lame-dev libshout3-dev libconfig++-dev  libfftw3-dev librtlsdr-dev wget

# Compile rtl_airband
RUN wget -O RTLSDR-Airband-X.Y.Z.tar.gz "https://github.com/charlie-foxtrot/RTLSDR-Airband/archive/refs/tags/v$rtl_airband_version.tar.gz" && \
    tar xvfz RTLSDR-Airband-X.Y.Z.tar.gz && \
    cd "RTLSDR-Airband-$rtl_airband_version" && \
    mkdir build && \
    cd build && \
    cmake ../ && \
    make && \
    make install

CMD /usr/local/bin/rtl_airband -e -c /usr/local/etc/rtl_airband.conf
