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
git clone https://github.com/uselibrary/KMS_Server
mv KMS_Server vlmcsd
mv vlmcsd /usr/local/
ln -sv /usr/local/vlmcsd/ /usr/local/KMS/
echo "export PATH=/usr/local/KMS/binaries/Linux/intel/static:\$PATH" > /etc/profile.d/vlmcs.sh
source /etc/profile.d/vlmcs.sh
chmod +x /usr/local/KMS/binaries/Linux/intel/static/*
echo "vlmcsd-x64-musl-static" >> /etc/rc.local
vlmcsd-x64-musl-static
echo "KMS Server is running"
