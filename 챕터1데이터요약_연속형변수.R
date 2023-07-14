챕터1 데이터요약
2. 연속형 변수
일반적인 경우 
summary(데이터)

리스트인 경우
lapply(list, summary)

종합적으로 모든 데이터 요약 내용 알고 싶은 경우 -1
library(pastecs)
stat.desc(데이터[c("변수", "변수", "변수")])
끝에 norm=TRUE 지정 시 정규분포 관련 통계량인 왜도와 첨도 산출됨

종합적으로 모든 데이터 요약 내용 알고 싶은 경우 -2
library(psych)
describe(데이터[c("변수", "변수", "변수")])

집단별 데이터 내용 알고 싶은 경우
1) 한개
tapply(데이터$변수, INDEX=데이터$변수, FUN=mean, na.rm=TRUE)
2) 열변수 여러개
by(데이터[c("열변수", "열변수")], INDICES=list(행변수이름으로쓰고싶은거=
                                                    데이터$행변수), FUN=summary)
aggregate(데이터[c("열변수", "열변수")], list(행변수이름으로쓰고싶은거=
                                              데이터$행변수), summary)
3) 열변수 여러개 다른방법
library(psych)
describeBy(데이터[c("열변수", "열변수")], group=list(행변수이름으로쓰고싶은거=
                                                          데이터$행변수))


1) 중윗수
median(데이터$원하는변수, na.rm=TRUE)

2) 평균
mean(데이터$원하는변수, na.rm=TRUE)

3) 범위
range(데이터$원하는변수, na.rm=TRUE)

4) 분산과 표준편차
var(데이터$변수, na.rm=TRUE)
sd(데이터$변수, na.rm=TRUE)