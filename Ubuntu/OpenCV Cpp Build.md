# OpenCV C++ Build

1. 설치 환경

- Linux 18.04



2. Anaconda 문제

- 기존에는 bashrc 에 anaconda 실행 명령어가 들어있어서 터미널 실행 시, 자동으로 anaconda 활성화되는 문제가 있었음
- 이에 `sudo gedit ~/.bashrc` 로 bashrc 를 열어 anaconda 관련 부분을 주석 처리함
- `which python3` 로 python3 위치 확인



3. 다음은 공식 문서에서 제공하는 설치 방법

```bash
cd ~

cvVersion="master"
mkdir installation
mkdir installation/OpenCV-"$cvVersion"

cwd=$(pwd)

sudo apt -y update
sudo apt -y upgrade

sudo apt -y remove x264 libx264-dev

## Install dependencies
sudo apt -y install build-essential checkinstall cmake pkg-config yasm
sudo apt -y install git gfortran
sudo apt -y install libjpeg8-dev libpng-dev

sudo apt -y install software-properties-common
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt -y update

sudo apt -y install libjasper1
sudo apt -y install libtiff-dev

sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd "$cwd"

sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils

# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt -y install qt5-default

# python3 libraries
sudo apt -y install python3-dev python3-pip
sudo -H pip3 install -U pip numpy
sudo apt -y install python3-testresources
cd $cwd
############ For Python 3 ############
# create virtual environment
python3 -m venv OpenCV-"$cvVersion"-py3
echo "# Virtual Environment Wrapper" >> ~/.bashrc
echo "alias workoncv-$cvVersion=\"source $cwd/OpenCV-$cvVersion-py3/bin/activate\"" >> ~/.bashrc
source "$cwd"/OpenCV-"$cvVersion"-py3/bin/activate

# now install python libraries within this virtual environment
pip install wheel numpy scipy matplotlib scikit-image scikit-learn ipython dlib
 
# quit virtual environment
deactivate

# download opencv and opencv_contrib
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout $cvVersion
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout $cvVersion
cd ..

# compile and install
cd opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D PYTHON_DEFAULT_EXECUTABLE=$(which python3) \
            -D INSTALL_C_EXAMPLES=ON \
            -D INSTALL_PYTHON_EXAMPLES=ON \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
            -D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-$cvVersion-py3/lib/python3.5/site-packages \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON ..
        
make -j4
make install
```



- 만약 설치 도중 **ippicv** 가 다운로드 되지 않는다면 `https://github.com/opencv/opencv_3rdparty/tree/ippicv/master_20191018/ippicv` 에서 리눅스 파일을 다운로드 받고 `~/opencv/build/3rdparty/ippicv` 에 넣어준다.



## 참고

- https://webnautes.tistory.com/1030
- https://www.learnopencv.com/install-opencv-4-on-ubuntu-18-04/