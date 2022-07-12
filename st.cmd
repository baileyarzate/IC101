#!/bin/bash


# EXPERIMENTAL
# Start IOC inside docker container instead
#docker run --network host -it ioc/IC101-pbg


# Default IOC start when running on local machine
cd iocBoot/iocIC101 && ./st.cmd
