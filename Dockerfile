FROM ubuntu

RUN apt update
RUN apt install build-essential \
  libtool autotools-dev autoconf pkg-config libssl-dev libevent-dev \
  software-properties-common -y
RUN add-apt-repository ppa:bitcoin/bitcoin -y
RUN apt update
RUN apt install build-essential libtool autotools-dev autoconf pkg-config \
  libssl-dev libevent-dev -y
RUN apt install nano unzip git build-essential libssl-dev libdb-dev \
  libdb++-dev libboost-all-dev libqrencode-dev aptitude -y
RUN apt install libdb4.8-dev libdb4.8++-dev -y
### qt
RUN apt install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev \
  qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev -y

RUN apt install bsdmainutils libzmq3-dev -y

COPY . /mnt/
WORKDIR /mnt/

RUN ./autogen.sh
RUN ./configure --with-libressl
RUN make

RUN mkdir -p /root/bitcoin
RUN cp /mnt/src/nullexd /root/bin/
RUN cp /mnt/src/qt/nullex-qt /root/bin/
