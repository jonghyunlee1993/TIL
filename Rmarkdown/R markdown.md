# R markdown

---

R markdown은 코드와 내용을 포함해서 컨텐츠를 만드는 툴

문서(pdf, docx, html), 프리젠테이션(ppt, html), 웹(html) 제작이 가능하다.



## 사용법

1. rmakrdown, knitr 패키지를 설치 
2. R studio의 File > New File > R markdown 



## 구성

- YAML Header

  - 해당 문서의 출력 형태, 추가적 기능 등을 정의하는 공간

  - 아래와 같은 식으로 정의한다. html 문서로 출력하며, 좌측에 목차를 보여주는 기능을 설정하였다. 

  - ```R
    ---
    title: "Untitled"
    subtitle: "Subtitle"
    author: "Author"
    date: "`r format(Sys.Date())`"
    output:
      html_document:
        fig_height: 6
        fig_width: 10
        highlight: textmate
        theme: cosmo
        toc: yes
        toc_depth: 3
        toc_float: yes
    ---
    ```

- Markdown Text

  - 일반적 텍스트를 작성하는 공간
  - $ 기호는 Latex 문법으로 수식을 입력할 수 있게 해준다.
  - `r nrow(cars)` 같은 식으로 실행 결과를 문장 안에 넣어줄 수 있다. 

- Code Chunk

  - 코드를 작성하고 해당 코드의 실행 결과를 출력하는 공간

  - 기본적으로 R 코드를 실행할 수 있지만 Python 등도 실행이 가능하다. 

  - 아래와 같이 코드를 삽입할 수 있으며, echo 옵선을 통해 해당 명령어를 보여줄지 여부를 선택할 수 있다. 

  - ```R
    ​```{r, echo = F}
    head(mtcars)
    ​```
    ```

- 이미지 삽입

  - 마크다운 문법

    - ```R
      <center>
      ![tidyverse logo](https://www.tidyverse.org/images/tidyverse-default.png){ width=50% }
      </center>
      ```

  - knitr

    - ```R
      ​```{r, fig.cap = "tidyverse logo", fig.align = "center"}
      library(knitr)
      include_graphics("https://www.tidyverse.org/images/tidyverse-default.png")
      ​```
      ```



## 참고문헌

[R Markdown 기초](https://blog.zarathu.com/posts/2019-01-03-rmarkdown/)

