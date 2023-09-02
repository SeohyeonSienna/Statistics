회귀분석
상관관계가 있어야 하며, 원인변수가 시간적으로 선행해야함.
그러나 횡단연구는 이런 것이 어렵기에 이를 한계에 적음

1. 단순회귀분석
최소자승법: 관측값과 회귀선 간 거리제곱 합 가장 작은 직선 도출
데이터셋.lm <- lm(종속변수 ~ 독립변수, data=데이터셋)
summary(데이터셋.lm)

1-1. 단순회귀분석 산점도와 회귀선 그리기
plot(데이터셋$종속변수 ~ 데이터셋$독립변수,
         col="cornflowerblue", pch=19,
         xlab="x축이름", ylab="y축이름",
         main="제목")
abline(데이터셋.lm, col="salmon", lwd=2)

1-2. 새로운 데이터 예측값 추정하기
데이터셋.new <- data.frame(변수명=c(5 ,10, 15))
predict(데이터셋.lm, newdata=데이터셋.new, interval="confidence")

1-3. 일부 서브셋에 회귀분석하기(일정 조건에 따라 집단 구분해서 회귀분석)
mean(데이터셋$변수)
lm(종속변수 ~ 독립변수, data=데이터셋, subset=(변수명 > mean(변수)))
lm(종속변수 ~ 독립변수, data=데이터셋, subset=(변수명 <= mean(변수)))

2. 다중회귀분석
데이터셋.lm <- lm(종속변수 ~ 독립변수 + 독립변수 + 독립변수 ...)
summary(데이터셋.lm)
library(stargazer)
stargazer(데이터셋.lm, type="text", no.space=TRUE)

2-1. 표준화계수 베타값 계산하기
library(QuantPsyc)
데이터셋.lm <- lm(종속변수 ~ 독립변수 + 독립변수 + ..., data=데이터셋)
lm.beta(데이터셋.lm)

데이터셋.lm <- lm(scale(종속변수명) ~ scale(독립변수명) + scale(독립변수명) + ,
              data = 데이터셋)
summary(데이터셋.lm)

