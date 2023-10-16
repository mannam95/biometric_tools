FROM ubuntu:18.04

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN apt-get install -y git
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y cmake
RUN apt-get install -y wget
RUN apt-get install -y tar tar-doc
RUN apt-get install -y vim nano less
RUN apt-get install -y xvfb

# Install QT 4
#RUN apt-add-repository ppa:rock-core/qt4
RUN apt-get install -y qt4-default 
RUN apt-get install -y qt4-dev-tools qt4-doc
RUN apt-get install -y qt4-demos

# Install QT 5
RUN apt-get install -y qt5-default 
RUN apt-get install -y qttools5-dev-tools qt5-doc

# Install OpenCV4
#RUN apt-get install -y build-essential pkg-config libgtk-3-dev
#RUN apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
#RUN apt-get install -y libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev
#RUN apt-get install -y gfortran openexr libatlas-base-dev python3-dev python3-numpy
#RUN apt-get install -y libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev
#RUN apt-get install -y libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

RUN apt-get install libopencv-core-dev -y
RUN ln -s /usr/lib/x86_64-linux-gnu/libopencv_core.so.3.2 /usr/lib/x86_64-linux-gnu/libcxcore.so.4
RUN apt-get install libopencv-video-dev -y
RUN ln -s /usr/lib/x86_64-linux-gnu/libopencv_video.so.3.2 /usr/lib/x86_64-linux-gnu/libcvaux.so.4
RUN ln -s /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.3.2 /usr/lib/x86_64-linux-gnu/libcv.so.4
RUN apt-get install libopencv-highgui-dev -y
RUN ln -s /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.3.2 /usr/lib/x86_64-linux-gnu/libhighgui.so.4
RUN apt-get install libqt4-xml -y
RUN apt-get install libqtgui4 -y

#RUN mkdir -p /root/opencv_build
#WORKDIR /root/opencv_build
#RUN git clone https://github.com/opencv/opencv.git
#RUN git clone https://github.com/opencv/opencv_contrib.git
#
#RUN mkdir -p /root/opencv_build/opencv/build
#WORKDIR /root/opencv_build/opencv/build
#
#RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
#    -D CMAKE_INSTALL_PREFIX=/usr/local \
#    -D INSTALL_C_EXAMPLES=ON \
#    -D INSTALL_PYTHON_EXAMPLES=ON \
#    -D OPENCV_GENERATE_PKGCONFIG=ON \
#    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
#    -D BUILD_EXAMPLES=ON ..
#
#RUN make -j16
#RUN make install

# Install Anguli

RUN mkdir /opt/Anguli
RUN mkdir /opt/Anguli/AnguliLin64
WORKDIR /opt/Anguli
RUN wget https://dsl.cds.iisc.ac.in/projects/Anguli/Anguli-Lin64bit.tgz
RUN tar -xzvf Anguli-Lin64bit.tgz -C AnguliLin64
WORKDIR /opt/Anguli/AnguliLin64
RUN chmod -R 770 Densitymaps
RUN chmod -R 770 Filterbank
RUN chmod -R 770 Lib
RUN chmod -R 770 noise_blob
RUN ./configure.sh

# Set the alias
RUN echo 'alias Anguli="xvfb-run -a /opt/Anguli/AnguliLin64/Anguli"' >> /root/.bashrc

#WORKDIR /root/NFIQ2
#RUN mkdir libOpenCV 
#WORKDIR /root/NFIQ2/libOpenCV
#RUN cmake -D CMAKE_MAKE_PROGRAM=make ../OpenCV
#RUN make opencv_core opencv_ts opencv_imgproc opencv_highgui opencv_flann opencv_features2d opencv_calib3d opencv_ml opencv_video opencv_objdetect opencv_contrib opencv_nonfree opencv_gpu opencv_photo opencv_stitching opencv_videostab
#RUN make install
#WORKDIR /root/NFIQ2
#RUN make
#RUN make install
