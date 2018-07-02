#!/bin/bash
### install deps
apt update
apt install build-essential \
  libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev \
  software-properties-common -y
add-apt-repository ppa:bitcoin/bitcoin -y
apt update
apt install build-essential libtool autotools-dev autoconf pkg-config \
  libssl-dev libevent-dev -y
apt install nano unzip git build-essential libssl-dev libdb-dev \
  libdb++-dev libboost-all-dev libqrencode-dev aptitude -y
apt install libdb4.8-dev libdb4.8++-dev -y
### qt
apt install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev \
  qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev -y

apt install bsdmainutils libzmq3-dev -y

### build 
./autogen.sh
./configure --with-libressl
make

### 
mkdir ~/bin
cp src/nullexd /usr/local/bin/ 
cp src/qt/nullex-qt /usr/local/bin/
chmod a+x /usr/local/bin/nullex*
