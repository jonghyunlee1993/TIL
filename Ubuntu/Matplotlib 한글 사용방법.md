# Matplotlib 한글 사용방법

---

## 환경

- 우분투 18.04
- Anaconda 3



## 방법

1. 나눔 폰트 설치

   ```bash
   $ sudo apt-get install fonts-nanum*
   $ sudo fc-cache -fv
   ```

   

2. Matplotlib font_manager 설정

   ```python
   from matplotlib import font_manager, rc
   font_name = font_manager.FontProperties(fname="/usr/share/fonts/truetype/nanum/NanumGothic.ttf").get_name()
   rc('font', family=font_name)
   ```

   만약 문자 깨지는 현상 계속 발생시

   

3. Matplotlib cache 초기화

   ```bash
   $> cd ~/.cache/matplotlib
   $> rm -rf *
   ```

   