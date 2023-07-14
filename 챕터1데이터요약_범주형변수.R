mul챕터1 데이터요약
1. 범주형변수
범주형 변수가 2개일 때
library(gmodels)
CrossTable(데이터$행, 데이터$열, prop.chisq=FALSE, dnn=c("행이름", "열이름"))

범주형 변수가 3개 이상일 때 - 1
multtab <- with(데이터, table(변수1,변수2,변수3))
multtab <- xtabs(~ 변수1 + 변수2 + 변수 3, data=데이터명)
multtab

margin.table(multtab, 1)
margin.table(multtab, 2)

ftable(multtab)
ftable(multtab, row.vars=c(변수번호, ,), col.vars=c(변수번호, ,))
ftable(prop.table(multtab. c(행변수번호, 행변수번호)), 1)

범주형 변수가 3개 이상일 때 - 2
ftable(데이터[c("변수1", "변수2", "변수3")], row.vars=c(변수번호, ,))
ftable(prop.table)

1) 빈도분석(빈도, 비율)

frqtab <- table( $ )
frqtab.prop <- prop.table(frqtab)

2) 교차표 만들기(빈도분석)

crosstab <- table( $ , $)
앞이 행, 뒤가 열
crosstab["", ""]
위 사용 시 원하는 행 변수와 열 변수의 교차값 추출 가능
crosstab <- xtabs(~ 행 이름 + 열 이름, data= )
위 사용 시 행열 이름 원하는대로 지정 가능

3) 교차표의 빈도분석(비율계산)하기
행의 합과 비율 계산
margin.table(crosstab, margin=1)
prop.table(crosstab, 1)

열의 합과 비율 계산
margin.table(crosstab, margin=2)
prop.table(crosstab, 2)

교차표 상 개별 셀의 비율 계산
prop.table(crosstab)

4) 교차표 행열 모두에 SUM 추가하기
빈도 총합 추가하기
addmargins(crosstab)

비율 총합 추가하기
addmargins(prop.table(crosstab)
