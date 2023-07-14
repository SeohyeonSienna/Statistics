챕터3 평균검정
1. 일표본 t검정
t.test(x=데이터$변수, mu=귀무가설모집단평균)
99% 신뢰구간인 경우
t.test(x=데이터$변수. mu=귀무가설모집단평균, conf.level=0.99)

2. 독립표본 t검정
t.test(formula=종속변수~독립변수, data=데이터)
막대도표로 표현하기
bars <- tapply(데이터$종속변수, 데이터$독립변수, mean)
lower <- tapply(데이터&종속변수, 데이터$독립변수, 
                   funtion(x) t.test(x)$conf.int[1])
upper <- tapply(데이터$종속변수, 데이터$독립변수, 
                   funtion(x) t.test(x)$conf.int[2])
library(gplots)
barplot2(bars, space=0.4, ylim=c(0, 3.0),
         plot.ci=TRUE, ci.lower, ci.u=upper, ci.color="maroon", ci.lwd=4,
         names.arg=c('집단1이름', '집단2이름'), col=c("coral". "darkkhaki"),
         xlab="x축이름", ylab="y축이름", main="표제목이름")

3. 대응표본 t검정: paired=TRUE 붙이면 됨
t.test(종속변수 ~ 집단변수, data=데이터, paired=TRUE)
와이드포맷을 대상으로 대응표본 t검정 하기
1) 롱포맷을 와이드포맷으로 바꾸기
데이터.wide <- spread(데이터, key=그룹변수, value=종속변수)
2) t검정하기
t.test(데이터.wide$'1', 데이터.wide$'2', paired=TRUE)

