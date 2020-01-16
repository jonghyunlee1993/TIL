# Window 10, Ubuntu 18.04 듀얼 부팅 구성

---

## 준비물

- 윈도우 PC
- Ubuntu ISO 파일
- Rufus

## 방법

1. 윈도우 PC에서 `컴퓨터 관리`에서 미리 디스크를 할당한다. 넉넉히 30 ~ 50GB 정도 잡아준다. [디스크 할당 방법](https://www.soft2000.kr/13111)

2. PC를 재부팅한다. 이때 BIOS로 진입하기 위해 `F12` 혹은 `DEL`키를 연타한다.

3. BIOS 진입 후에 PC에 따라 HDD를 검색할 수 없는 경우가 있기 때문에 **System Configuration** > **SATA Operation** and select **AHCI**. 해준다. [AHCI 설정 방법](https://askubuntu.com/questions/696413/ubuntu-installer-cant-find-any-disk-on-dell-xps-13-9350)

4. 우분투 설치하고 (이때 설치 옵션을 기타로 주어서 아까 잘라놓은 파티션에 설치) [전체 방법 요약](https://cupjoo.tistory.com/53)

5. 설치 후 grub를 통해 우분투를 실행시킨다. 윈도우는 아마 인식이 되지 않을텐데, GPT fdisk를 설치하여 인식해준다. [GPT fdisk 설치](https://ingles.tistory.com/6)

   ```bash
   sudo add-apt-repository ppa:yannubuntu/boot-repair
   sudo sed 's/trusty/saucy/g' -i /etc/apt/sources.list.d/yannubuntu-boot-repair-trusty.list
   sudo apt-get update
   sudo apt-get install -y boot-repair && (boot-repair &)```
   ```

6. 윈도우로 돌아가서 easyBSD를 설치해서 윈도우 리눅스 멀티 부팅을 예쁘게 만들어 준다.[easyBCD](https://m.blog.naver.com/PostView.nhn?blogId=jprapstyle&logNo=60161191855&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

## 우분투 한글

1. language support 초기 설치

2. IBUS로 선택한 후에 Install/Remove Language에서 Korean Hangul IBUS 선택

   없을 시 재부팅

3. Text Entry 들어가서 Ctrl + Space 등으로 Switch to next source using 설정하고 끈다. 

4. 우상단 태극 문양 우 클릭 > 세팅 > 토글 키 다 지우고 start in hangul mode 설정

