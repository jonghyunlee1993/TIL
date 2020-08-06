# Tensorlfow-gpu 세팅

1. 테스트 환경

- windows 10, anaconda, python 3.6

2. 실행 코드

```bash
# 가상환경 세팅
$ conda create -n tensorflow python=3.6 tensorflow-gpu jupyter
$ conda activate tensorflow
# LSTM 계열 사용을 위한 cudnn 업데이트
$ conda install -c anaconda cudnn
$ pip install matplotlib pandas
```

cuda 10.1과 cudnn 7.6 을 설치해주는 것으로 보이며 환경 오류시 어느 정도 도움이 될 것으로 보임

