# Jupyter Lab / Notebook 원격 접속 세팅

---

- 환경
  - Ubuntu 18.04
  - Anaconda python 3 

1. Jupyter Lab 설치
   - `conda install jupyterlab` 으로 jupyter lab을 설치한다.
   - jupyter lab은 jupyter notebook의 한 단계 업그레이드 버전이다.

2. Jupyter Lab 원격 세팅
   - `jupyter notebook --generate-config` 명령으로 주피터 설정 파일으 만든다.
   - Ubuntu 기준으로 해당 파일은 home 디렉토리 하위의 .jupyter 에 생성된다.
   - 파일 이름은 `jupyter_notebook_config.py` 이다

3. PW 설정

   - `ipython` 을 실행하고 다음과 같은 명령을 입력한다.

   - ```python
     from notebook.auth import passwd
     
     passwd()
     ```

   - 원하는 패스워드를 입력하고 해당 패스워드가 암호화되어 출력된다. 

   - 이를 복사해두자. `shad1:~~~` 의 꼴이다.

   - self-signed certificate를 생성하기 위해 다음과 같은 명령어를 입력한다.

     - `openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem`
     - out의 파일 패스를 잘 기억해두자.

4. 포트 개방

   - `sudo ufw allow 8888` 과 같이 원하는 포트를 개방한다.
   - 기본 포트는 8888이다.

5. config 파일 수정

   - gedit 이나 vim 등을 이용해 `jupyter_notebook_config.py` 파일을 수정해야 한다.

   - 동일 ip내 환경을 사용할 것이라면 미리 `ifconfig` 로 ip 주소를 확인하자

   - 외부에서 접속을 가능하게 하려면 공유기의 설정에 접근하여 DDNS 설정 및 포트포워딩을 해야 한다

     - 향후 진행 예정...

   - `jupyter_notebook_config.py` 파일에 다음과 같이 코드를 추가한다.

     - ```python
       c = get_config()
       c.NotebookApp.password     = 'shad1: ~~ '
       c.NotebookApp.open_browser = False
       c.NotebookApp.notebook_dir = u'/실행시/원하는/패스'
       c.NotebookApp.ip           = 'ifconfig로 확인한 ip 주소'
       c.NotebookApp.port_retries = '원하는 포트의 번호 / 기본은 8888'
       c.NotebookApp.certfile     = 'mycert.pem/저장/경로'
       ```

     - 저장하고 종료한다.

6. 테스트 및 접속

   - `jupyter lab --no-browswer` 명령으로 브라우저 없이 실행시킨다.
   - 동일 네트워크의 다른 PC의 브라우저에서 다음과 같이 입력한다.
     - `https://앞서.입력한.IP.주소:지정한포트번호`
     - 예를 들어 `192.168.1.1:8888` 같은 꼴이다. 
     - 지정한 패스워드를 입력하면 다음과 같은 화면에 진입할 수 있다.
   - ![image-20200603200528485](/Users/jonghyunlee/Library/Application Support/typora-user-images/image-20200603200528485.png)
   - 성공하면 위와 같은 창을 볼 수 있다. jupyter notebook의 tree가 익숙하다면  `192.168.1.1:8888/tree` 라고 입력한다.
   - ![image-20200603200635883](/Users/jonghyunlee/Library/Application Support/typora-user-images/image-20200603200635883.png) 

## 추후 확인 사항

- 포트 포워딩 및 DDNS 를 이용한 외부 접속