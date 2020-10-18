# Docker 로 Ubuntu 띄우기 실습

1. 어제 설치했던 cvat 랑 충돌이 발생하는 것 같으니 모두 지워주기

   1. git bash를 실행합니다.
   2. 모든 컨테이너를 삭제합니다. `docker rm $(docker ps -a -q) `
   3. 모든 이미지를 삭제합니다. `docker rmi $(docker ps -a -q) -f`

2. ubuntu 18.04 이미지를 다운 받습니다.

   1. `docker pull ubuntu:18.04`
   2. 만약 최신 버전인 20.04를 받고자 하면 `docker pull ubuntu:latest`

3. docker 컨테이너를 만들어줍니다. 

   1. 만약 18.04로 받았다면 `docker run --rm -it ubuntu:18.04 /bin/bash`
   2. 만약 최신으로 받았다면 `docker run --rm -it ubuntu:latest /bin/bash`

4. apt (우분투 패키지 관리자 / pip 같은 거라고 생각하시면 됩니다)

   1. `apt update`

   2. `apt install - y python3 python3-pip vim`

      1. -y 옵션은 설치 여부를 무조건 y 로 체크하겠다는 (설치한다는) 설정입니다.
      2. liunux 계열은 python2가 디폴트 값이라 python3로 명시해주어야 python3를 사용할 수 있습니다.
      3. pip 은 익히 아시는 패키지 관리자입니다. 앞서 말씀드린 것과 같이 python3 라고 명시해주지 않으면 나중에 고생할 수 있습니다. 원하는 파이썬 버전은 3인데 실제적 설치는 2에다가 할 수도 있기 때문에
      4. vim은 간단한 텍스트 편집기 입니다. 

   3. python3를 체크해봅니다.

      1. `python3` 라고 쳐서  python3 인터프리터에 들어가봅니다.
      2. controll + C 를 눌러서 종료합니다.

   4. pip3 를 체크해봅시다.

      1. `pip3 install numpy`

   5. 간단한 파이썬 스크립트를 작성해봅니다.

      1. 텍스트 에디터인 vim을 이용해서 hello-world.py라는 텍스트 파일을 작성하겠습니다.`vim ./hello-world.py `

      2. 해당 텍스트 파일 안에서 i 버튼을 눌러서 삽입 모드로 변경하고 텍스트를 작성합니다.

      3. ```python
         import numpy
         
         print('Hello World!')
         ```

      4. 작성이 끝났으면 ESC 를 눌러 삽입 모드에서 관리 모드로 넘어온 후 `:wq` 를 입력하여 저장하고 종료합니다.

   6. 파이썬 스크립트를 실행시켜봅니다.

      1. python3 라고 명시하고 ./ 명령어를 입력하면 해당 스크립트를 실행하라는 의미입니다.`python3 ./hello-world.py`
