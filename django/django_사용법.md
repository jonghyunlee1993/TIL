# django 사용법

---

## django(이하 장고) ?

> python 웹 어플리케이션 프레임워크
>
> MVC (Model - View - Controller) 패턴을 따름



## 구성

> 파이썬 코딩으로 구현한 관계형 데이터베이스의 스키마를 구축하는 Model
>
> HTTP 요청을 처리하는 웹 템플릿 시스템 View
>
> URL 라우팅을 처리하는 URL controller



## 여론조사 튜토리얼

* 프로그래머스, 프로그래밍 강의 참고 
* https://programmers.co.kr/learn/courses/6



## Flow

### 프로젝트 생성

* 프로젝트 생성

  django-admin startproject "your project name"`

* 프로젝트 실행

  ` python manage.py runserver `

* 프로젝트 확인

  Localhost:8000 혹은 127.0.0.1:8000

### 앱 생성

앱은 프로젝트 아래의 기능 단위

* 앱 생성

  `python manage.py startapp "your app name"`

* models.py에 db 모델 지정

  ```python
  class Candidate(models.Model):
    name = models.CharField(max_length = 10)
    introduction = models.TextField()
    area = models.CharField(max_length = 15)
    party_number = models.IntegerField(default = 0)
  	
  	def __str__(self):
  		return(self.name)
  ```

* 해당 앱의 views.py 에 함수 지정

  ```python
  def index(request):
  	candidates = Candidate.objects.all()
  	context = {'candidates': candidates}
  	return render(request, 'elections/index.html', context)```
  ```

* urls.py 에 url 지정

  ```python
  from . import views
  
  urlpatterns = [
  	path('', views.index, name = "home"),
  ]
  ```

* DB migration

  다음 명령어를 순서대로 실행

  ` python manage.py makemigrations`

  `python manage.py migrate`

  sqlite DB에 models.py 에 지정한 스키마가 생성

### Admin

* 관리자 계정 및 관리자 권한 실행

  ` python mange.py createsuperuser`

  이후 localhost:8000/admin 으로 접속

* DB 데이터를 입력 / 열람할 수 있다. 

### Templates

* html 문서를 만들고 해당 문서에 원하는 데이터를 렌더링할 수 있음

* 앱 폴더 아래에 `templates` 폴더를 생성하고 해당 폴더 아래에 "index.html" 파일을 생성

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <title>선거 후보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  </head>
  <body>
  <div class="container">
      <table class="table table-striped">
          <thead>
          <tr>
              <td><B>이름</B></td>
              <td><B>소개</B></td>
              <td><B>출마지역</B></td>
              <td><B>기호</B></td>
          </tr>
          </thead>
          <tbody>
          {% for candidate in candidates %}
          <tr>
              <td> {{ candidate.name }} </td>
              <td> {{ candidate.introduction }} </td>
              <td> {{ candidate.area }} </td>
              <td>기호 {{ candidate.party_number }} 번</td>
          </tr>
          {% endfor %}
          <tbody>
      </table>
  </body>
  ```

  * views.py 를 다음과 같은 식으로 수정

  ```python
  from django.shortcuts import render
  from django.http import HttpResponse
  
  from .models import Candidate
  
  def index(request):
      candidates = Candidate.objects.all()
      context = {'candidates' : candidates} #context에 모든 후보에 대한 정보를 저장
      return render(request, 'elections/index.html', context) # context로 html에 모든 후보에 대한 정보를 전달
  ```

## 참고

https://programmers.co.kr/learn/courses/6/

https://github.com/jonghyunlee1993/django_poll_app