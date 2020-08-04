# MySQL 설치

- Ubuntu 18.04



1. MySQL 설치

``` bash
sudo apt-get update
sudo apt-get insatll -y mysql-server
```



2. MySQL 초기화

``` bash
sudo mysql_secure_installation
```

- 패스워드 강력한 정도 설정 옵션 : 0 (LOW)
- 관리자 권한 패스워드 입력
- 익명 사용자 제거 옵션 : y
- 외부 로그인 차단 옵션 : y
- test 데이터 베이스 삭제 : y
- previleges table 로드 : y



3. MySQL 재시작

```bash
sudo /etc/init.d/mysql restart
```



4. 테스트

```bash
sudo mysql -u root -p
# 이후 등록한 패스워드를 입력해서 접속한다
```

