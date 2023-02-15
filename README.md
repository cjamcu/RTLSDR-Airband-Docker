# RTLSDR-Airband-Docker
A Dockerfile for the RTLSDR-Airband program, simplifying installation. Based on charlie-foxtrot's original project, it enables the program to run in a Docker container with all necessary dependencies.

## Overview
RTLSDR-Airband is a program that receives analog radio voice channels and produces audio streams that can be routed to various outputs, such as online streaming services like LiveATC.net. Originally, the only SDR type supported by the program was the Realtek DVB-T dongle. However, with the help of the SoapySDR vendor-neutral SDR library, other radios are now supported as well.

This Dockerfile is designed to run the RTLSDR-Airband service inside a Docker container. It includes all necessary dependencies and can be easily installed on any system that supports Docker.

## Installation
To use this Dockerfile, follow these steps:

1. Install [Docker](https://www.docker.com/products/docker-desktop) and [Docker Compose](https://docs.docker.com/compose/install/).
2. Clone the repository containing the `docker-compose.yml` file: `git clone https://github.com/cjamcu/RTLSDR-Airband-Docker.git.git`
3. Navigate into the cloned directory: `cd RTLSDR-Airband-Docker`
4. Create a new file called `rtl_airband.conf` and configure the settings according to your needs (refer to the [RTLSDR-Airband documentation](https://github.com/charlie-foxtrot/RTLSDR-Airband/wiki) for details).
5. Run the following command to start the service: `docker-compose up -d`

This command will start the RTLSDR-Airband service in the background, with the configuration settings specified in the `rtl_airband.conf` file. The `devices` section of the `docker-compose.yml` file ensures that the USB devices are accessible from within the container, while the `volumes` section mounts the `rtl_airband.conf` file to the appropriate location inside the container.

If you need to make changes to the `rtl_airband.conf` file, simply edit the file and then run the following command to restart the service: `docker-compose restart`.

## Contributing
This project is based on the original RTLSDR-Airband project by [charlie-foxtrot](https://github.com/charlie-foxtrot). If you would like to contribute to the original project, please refer to the [contributing guidelines](https://github.com/charlie-foxtrot/RTLSDR-Airband/blob/master/CONTRIBUTING.md) in the original repository.

If you would like to contribute to this Dockerfile, please feel free to submit a pull request.
