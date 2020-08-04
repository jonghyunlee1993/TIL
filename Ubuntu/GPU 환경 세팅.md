# GPU 환경 세팅

---

- 환경
  - Ubuntu 18.04
  - Nvidia gpu Quadro RTX 6000

1. install nvidia-driver

- `sudo ubuntu-drivers devices` 를 이용해서 device 확인 가능 및 추천 드라이버 버전 확인	
- 이 경우에는 440 이어서
  - `sudo apt install nvidia-driver-440`

2. install cuda toolkit

- tensorflow 는 현재 (2020.05.13) cuda 10.1 까지 지원하고 있으니 꼭!!!! 버전을 확인할 것.
- 10.2 설치했다가 고생했음
- `sudo apt install cuda-10-1`
- 설치 후 `nvcc` 혹은 `nvidia-smi` 로 확인해볼 것

3. install cnDNN

- nvidia developer 사이트에서 cuda 10.1 에 해당하는 cuDNN 버전 이미지 다운로드 (~.deb)
- `dpkg -i libcudnn~~`
- `sudo apt install libcudnn7`
- `sudo apt install libcudnn7=[cudnn_version+cuda_version]`
  - `sudo apt install libcudnn7=7.6.5.32-1+cuda10.1`

4. check

```python
import tensorflow as tf

tf.test.is_gpu_available()
```

