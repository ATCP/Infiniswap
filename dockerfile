FROM ubuntu

RUN apt-get update && apt-get install -y vim htop gcc g++ git
RUN git clone https://github.com/ltgoter/Infiniswap.git
