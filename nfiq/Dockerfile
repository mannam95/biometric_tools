FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -r srinath -g 1000

RUN useradd -m -r -g srinath -G root -u 1000 srinath

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt-get install -y tzdata \
 && apt install -y nano curl

RUN mkdir -p /root/NFIQ2

RUN apt-get install -y git \
 && apt-get install -y build-essential \
 && apt-get install -y gcc-8 \
 && apt-get install -y g++-8 \
 && apt-get install -y cmake libssl-dev openssl \
 && apt-get install -y vim less imagemagick imagemagick-doc apt-utils man \
 && apt-get install -y libdb-dev libdb++-dev libopenjp2-7 libopenjp2-7-dev libjpeg-dev libsqlite3-dev libtiff5-dev libpng-dev


WORKDIR /root
RUN git clone --recursive https://github.com/usnistgov/NFIQ2.git
WORKDIR /root/NFIQ2
RUN mkdir build
WORKDIR /root/NFIQ2/build
RUN cmake ..
RUN cmake --build .

WORKDIR /root
COPY nbisCommands.txt /root/
COPY installNBIS.sh /root/
RUN ./installNBIS.sh
WORKDIR /

#CMake Error: The source directory "/root/NFIQ2/OpenCV" does not exist.
#RUN make opencv_core opencv_ts opencv_imgproc opencv_highgui opencv_flann opencv_features2d opencv_calib3d opencv_ml opencv_video opencv_objdetect opencv_contrib opencv_nonfree opencv_gpu opencv_photo opencv_stitching opencv_videostab
#RUN make install
#WORKDIR /root/NFIQ2
#RUN make
#RUN make install


RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh

# install in batch (silent) mode, does not edit PATH or .bashrc or .bash_profile
# -p path
# -f force
RUN bash Miniconda3-py39_4.12.0-Linux-x86_64.sh -b -p /opt/conda

RUN rm Miniconda3-py39_4.12.0-Linux-x86_64.sh

ENV PATH=/opt/conda/bin:${PATH}

COPY requirements.txt requirements.txt

RUN conda install -y pip

RUN pip install -r requirements.txt
