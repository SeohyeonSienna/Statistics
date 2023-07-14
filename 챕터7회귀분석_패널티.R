챕터 7-3. 패널티회귀분석
회귀분석 모델 간명화를 위해 사용
독립변수가 너무 많은 모델에 페널티를 부과하는 방식으로 단순화
잔차 제곱합과 패널티항의 합이 최소가 되는 회귀계수 추정
종류로 1) 릿지, 2) 라소, 3) 일래스틱회귀분석이 있음

1. 릿지회귀분석
모델 설명력에 기여 못하는 독립변수의 회귀계수를 0에 근접하도록 축소
0으로 만들지는 않음

1) 데이터셋 전처리 - 훈련 데이터와 테스트 데이터 분할
library(caret)
set.seed(123)
훈련변수명 <- createDataPartition(y=데이터셋$결과변수, p=0.7(비율), 
                             list=FALSE)
데이터명.훈련변수명 <- 데이터셋[훈련변수명,]
데이터명.테스터변수명 <- 데이터셋[-훈련변수명,]

2) 패널티회귀분석 수행
glmnet 패키지의 glmnet() 함수 이용
연속병 변수만 가능하여 범주형 변수는 더미로 변환해야함

2-1) 더미변수로 변환하기
x <- model.matrix(결과변수 ~ ., 데이터명.훈련변수명)[,-1]
y <- 데이터명.훈련변수명$결과변수

2-2) 릿지회귀분석 - cv.glment(), alpha = 0
library(glmnet)
set.seed(123)
데이터명.cv <- cv.glmnet(x=x, y=y, family="gaussian", alpha=0)
plot(데이터명.cv)
데이터명.cv$lambda.min
log(데이터명.cv$lambda.min)

2-4) 릿지회귀분석 예측모델 생성하기
데이터명.gnet <- glmnet(x, y, family="gaussian", alpha=0, 
                    lambda=데이터명.cv$lambda.min)
coef(데이터명.gnet)

2-5) 릿지회귀분석 예측모델 성능 평가하기
데이터명.테스터변수명.x <-model.matrix(결과변수 ~ ., 
                                 데이터명.훈련변수명)[,-1]
데이터명.pred <- predict(데이터명.gnet, newx=데이터명.테스터변수명.x)
postResample(pred=데이터명.pred, obs=데이터명.훈련변수명$결과변수)


2. 라소회귀분석
모델 설명력에 기여 못하는 독립변수의 회귀계수를 0으로 만듦
즉, 모델에서 해당 변수 제거 -> 더욱 간명한 모델 / 다만 예측정확도는 감소

1) 라소회귀분석
데이터명.cv$lambda.1se
log(데이터명.cv$lambda.1se)
coef(데이터명.cv, 데이터명.cv$lambda.1se)

1-1) 라소회귀분석 예측모델 생성하고 평가하기
데이터명.gnet1 <- glmnet(x, y, family="gaussian", alpha=1, 
                    lambda=데이터명.cv$lambda.min)
데이터명.pred1 <- predict(데이터명.gnet1, 
                          newx=데이터명.테스터변수명.x)
postResample(pred=데이터명.pred1, obs=데이터명.훈련변수명$결과변수)

데이터명.gnet2 <- glmnet(x, y, family="gaussian", alpha=1, 
                     lambda=데이터명.cv$lambda.1se)
데이터명.pred2 <- predict(데이터명.gnet2, 
                          newx=데이터명.테스터변수명.x)
postResample(pred=데이터명.pred2, obs=데이터명.훈련변수명$결과변수)

3. 일래스틱회귀분석 - caret 패키지의 traim() 이용
릿지 + 라소
library(caret)
set.seed(123)
데이터명.cv <- train(form=결과변수 ~ ., data=데이터셋.train, 
                 method="glmnet", trControl=trainControl
                 (method="cv", number=10), tuneLength=10)
데이터명.cv$best.Tune
데이터셋.gnet <- glmnet(x, y, family="gaussian", 
                    alpha=Boston.cv$bestTune$alpha,
                    lambda=Boston.cv$bestTune$lambda)
성능평가
데이터명.pred <- predict(데이터명.gnet, 
                          newx=데이터명.테스터변수명.x)
postResample(pred=데이터명.pred, obs=데이터명.훈련변수명$결과변수)

4. 릿지, 라소, 일래스틱 비교
