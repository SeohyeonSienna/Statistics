챕터 8. 다항 로지스틱 분석, 포아송 회귀분석
1. 다항 로지스틱 분석 - VGAM 패키지; vglm() 함수
결과변수가 3개 이상의 범주를 갖는 경우
마지막 범주가 기준 범주가 됨
g개의 범주 있을 시 g-1개의 모델 생성

1-1) 다항 로지스틱 분석
library(VGAM)
데이터명.mlogit <- vglm(PID ~ ., family=multinomial(), data=데이터명)
summary(데이터명.mlogit)

exp(coef(데이터명.mlogit))

1-2) 다항 로지스틱 범주별 예측확률
데이터명.mlogit.pred <- fitted(데이터명.mlogit)
head(데이터명.mlogit.pred)
testdata <- data.frame(원하는 예측변수 제외하고는 평균으로 고정)
testdata
데이터명.mlogit.pred <- predict(데이터명.mlogit, newdata=testdata
                                , type="response")
* 범위 설정 => 변수명 = seq(하한, 상한, 간격)
cbind(testdata, 데이터명.mlogit.pred)

2. 포아송회귀분석 - glm()
결과변수가 특정 기간 동안의 사건발생횟수
따라서 음수일 수 없으며, 정규분포를 띄지 않는다.

2-1) 포아송 회귀분석
히스토그램 그려서 분포 확인하기
hist(데이터명$변수명, breaks=20, col="cornflowerblue",
         xlab="", main="")

데이터명.possion <- glm(결과변수 ~ 예측변수, data = 데이터명, 
                        family=poisson())
summary(데이터명.possion)
exp(coef(데이터명.possion))


2-2) 포아송 회귀분석 모델 통계적 유의성 확인하기
pchisq(q= deviance 값 빼기, df= 자유도 값 빼기, lower.tail=FALSE)

2-3) 과산포 확인하기
독립성 온전히 충족 못해 상태의존성 발생하는 것이 과산포 원인
deviance(데이터명.possion)/df.residual(데이터명.possion)
library(qcc)
qcc.overdispersion.test(데이터명$결과변수명, type="poisson")

2-4) 과산포가 있는 경우 포아송 회귀분석 하기
데이터명.qpossion <- glm(결과변수 ~ 예측변수, data = 데이터명, 
                        family=quasipoisson())
summary(데이터명.qpossion)
exp(coef(데이터명.qpossion))

2-5) 관측기간이 다를 때 포아송회귀분석 하기 - offset=log(time) 추가
데이터명.possion <- glm(결과변수 ~ 예측변수, data = 데이터명, 
                        family=poisson(), offset=log(시간변수))
summary(데이터명.possion)
deviance(데이터명.possion)/df.residual(데이터명.possion)
qcc.overdispersion.test(데이터명$결과변수명, type="poisson")
exp(coef(데이터명.possion))
