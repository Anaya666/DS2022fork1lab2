#!/bin/bash

# Update and upgrade system packages
/usr/bin/apt update -y
/usr/bin/apt upgrade -y

# Install git
/usr/bin/apt install -y git 

# Install Python3 and pip, then install pandas and boto3
/usr/bin/apt install -y python3 python3-pip
/usr/bin/python3 -m pip install pandas boto3

# Install nginx
/usr/bin/apt install -y nginx

