챕터 8. 로지스틱 회귀분석
범주형 변수, 결과변수가 횟수여서 정규분포를 따르지 않을 때
로지스틱은 이 중 결과변수가 이분형 변수, 이항분포 따름
결과변수 예측값 항상 0과 1 사이; 일정 기준값보다 크면 사건 발생, 작으면 사건 미발생으로 봄
사건이 발생할 가능성이 그렇지 않을 가능성의 몇 배인지를 나타냄

데이터명.logit <- glm(결과변수 ~ ., data = 데이터명.train,
                      family=binomial(link="logit"))
데이터명.logit.pred <- predict(데이터명.logit, newdata=데이터명.test,
                               type="response")
데이터명.logit.pred <- ifelse(데이터명.logit.pred > 0.5, "pos", "neg")
table(데이터명.test$결과변수, 데이터명.logit.pred,
          dnn=c("Actual", "Predicted"))
mean(데이터명.logit.pred==데이터명.test$ 결과변수)

1. 로지스틱 회귀분석: glm()
1) 이항 로지스틱 회귀분석
데이터명$결과변수 <- factor(ifelse(데이터명$결과변수=="no", 1, 2),
                    levels=c(1, 2), labels=c("no", "yes"))
str(데이터명)
levels(데이터명$결과변수)
table(데이터명$결과변수)
prop.table(table(데이터명$결과변수))

데이터명.logit <- glm(결과변수 ~ ., data = 데이터명, 
                      family=binomial(link="logit"))
summary(데이터명.logit)

exp(coef(데이터명.logit))

1-1) 모형 통계적 검증
pchisq(q=Null값 - redisual 값, df = Null 자유도 - Residual 자유도,
       lower.tail = FALSE)

1-2) 이항 로지스틱 회귀분석을 사용하여 결과변수 1 일 때 예측하기
데이터명$결과변수 <- factor(ifelse(데이터명$결과변수=="no", 1, 2),
                           levels=c(1, 2), labels=c("no", "yes"))
데이터명.logit.pred <- predict(churn.logit, newdata=데이터명, 
                           type="response")
head(데이터명.logit.pred)
데이터명.logit.pred <- factor(데이터명.logit.pred > 0.5(판정기준),
                              levels=c(FALSE, TRUE), labels=c("no", 
                                                              "yes"))
head(데이터명.logit.pred)
table(데이터명.logit.pred)

1-3) 예측모델의 정확도 평가하기
table(데이터명$결과변수, 데이터명.logit.pred, dnn=("actual", 
                                       "predicted"))
mean(데이터명$결과변수==데이터명.logit.pred)

1-4) 보다 간명한 모델 구하기
데이터.logit2 <- step(데이터.logit)
summary(데이터.logit2)

1-5) 관심있는 예측변수의 효과만 보기
* 연속형변수인 경우
testdata <- data.frame(연속형변수=mean(데이터명$변수),
                         연속형변수=mean(데이터명$변수)
                         범주형변수=c(0:제일큰횟수))
z <- coef(데이터.logit2)[1] +
  (as.matrix(testdata)%*%coef(데이터.logit2)[-1])
p <- 1/(1+exp(-z))
testdata$prob <- p
testdata[c("관심있는예측변수", "prob")]

* 범주형변수인 경우
testdata <- data.frame(범주형변수=c(0:제일큰횟수),
                            범주형변수="no(가장낮은범주)")
testdata$prob <- predict(데이터.logit2, newdata=testdata, 
                            type="response")
testdata[c("관심있는예측변수", "prob")]

1-6) 과산포 문제 확인하기
* 과산포 확인 방법
deviance(데이터.logit2/df.residual(데이터.logit2))
1보다 작을 시 과산포 위험 없음
* 과산포 통계적으로 검증하기

testdata[c("관심있는예측변수", "prob")]