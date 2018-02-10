#!/bin/bash
#URL: https://github.com/uselibrary/KMS_Server
#E-mail: emkqson@gmail.com
clear
echo "    ################################################"
echo "    #                                              #"
echo "    #               Build KMS Server               #"
echo "    #                https://pa.ci                 #"
echo "    #                 Version 0.1                  #"
echo "    ################################################"
#Prepare the installation environment
echo -e ""
echo -e "Prepare the installation environment."
if cat /etc/*-release | grep -Eqi "centos|red hat|redhat"; then
  echo "RPM-based"
  yum -y install git
elif cat /etc/*-release | grep -Eqi "debian|ubuntu"; then
  echo "Debian-based"
  apt-get -y install git
else
  echo "This release is not supported."
  exit
fi
#Build KMS Server
