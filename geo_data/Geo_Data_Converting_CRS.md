# Geo Data Analysis

---

서울시 미세먼지 정보를 활용한 프로젝트를 진행하면서 통계청에서 배포하는 집계구역을 사용



## 지도 원점

각각의 지도는 원점이 있으며, 해당 원점은 지도마다 다를 수 있다. 단순히 경도, 위도만 기준이 아니다.

해당 변환을 위해서 필요 파라미터를 알아야하는데, 가령 서울 열린데이터 광장 생활인구 데이터에 사용된 2016 집계구 기준은 다음과 같은 코드를 적용하면 된다. (R 기준)

```R
# shp 파일 로드
library(rgdal)
my_spdf <- readOGR(dsn = "path/to/map/", layer = "seoul") 

# 해당 shp 파일의 좌표계
from_crs = CRS("+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m")  

# 경도, 위도 좌표계
to_crs = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs") 

proj4string(my_spdf) = from_crs
converted = spTransform(my_spdf, to_crs)
```

만약 QGIS 와 같은 프로그램을 사용한다면 다음 CRS를 선택해준다. 

![](/Users/jonghyunlee/GitRepo/TIL/geo_data/Screen Shot 2019-12-23 at 16.44.01.png)

해당 변환이 완료된 데이터는 경도, 위도로 변환되어 경, 위도를 통한 지도 시각화가 가능하다. 

아래는 백화점 위치를 매핑하는 코드의 예시이다. 앞서 변환한 서울 집계구 파일을 geom_polygon 함수 형태로 불러왔다. 

```R
# ggmap을 통해 서울 지도를 불러오고 해당 지도 위에 백화점 위치를 매핑

cen = c(126.98, 37.5642135)
register_google(key='Your API key')
map <- get_googlemap(center = cen, maptype = "roadmap", zoom = 11)

theme_update(text = element_text(family = "NanumGothic"))

ggmap(map) +
  geom_polygon(data = converted, aes(x = long, y = lat, group = group), alpha = 0.6, fill='lightblue') +
  geom_point(data = departments, aes(colour = 회사명), size = 4, alpha = 0.5) +
  scale_colour_manual(values = c("롯데" = 'red', "현대" = "blue", "신세계" = 'yellow')) +
  ggtitle("분석 대상 서울 소재 백화점") +
  labs(x = "경도", y = "위도") 
```

![](/Users/jonghyunlee/GitRepo/TIL/geo_data/서울 소재 백화점.jpeg)