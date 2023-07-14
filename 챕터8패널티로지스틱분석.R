챕터 8. 패널티(라소) 로지스틱회귀분석
로지스틱 모델에 있는 예측변수 간명화할 때 사용
결측값 없애기 = na.omit(데이터명)

x <- model.matrix(결과변수 ~ ., 데이터명.훈련변수명)[,-1]
y <- ifelse(데이터명$범주형결과변수=="pos", 1, 0)

library(glmnet)
set.seed(123)
데이터명.cv <- cv.glmnet(x=x, y=y, family="gaussian", alpha=1)
데이터명.cv$lambda.min
데이터명.cv$lambda.1se
coef(데이터명.cv, 데이터명.cv$lambda.min)
coef(데이터명.cv, 데이터명.cv$lambda.1se)

데이터명.gnet1 <- glmnet(x, y, family="binomial", alpha=1, 
                     lambda=데이터명.cv$lambda.min)
데이터명.test.x <- model.matrix(결과변수 ~ ., 데이터명.test)[,-1]
데이터명.pred1 <- predict(데이터명.gnet1, 
                          newx=데이터명.테스터변수명.x,
                          type="response")
데이터명.pred1 <- ifelse(데이터명.pred1 > 0.5, "pos", "neg")
table(데이터명.test$ 결과변수, 데이터명.pred1,
          dnn=c("Actual", "Predicted"))
mean(데이터명.pred1==데이터명.test$ 결과변수)

데이터명.gnet2 <- glmnet(x, y, family="binomial", alpha=1, 
                     lambda=데이터명.cv$lambda.1se)
데이터명.test.x <- model.matrix(결과변수 ~ ., 데이터명.test)[,-1]
데이터명.pred2 <- predict(데이터명.gnet2, 
                          newx=데이터명.테스터변수명.x,
                          type="response")
데이터명.pred2 <- ifelse(데이터명.pred1 > 0.5, "pos", "neg")
table(데이터명.test$ 결과변수, 데이터명.pred1,
          dnn=c("Actual", "Predicted"))
mean(데이터명.pred1==데이터명.test$ 결과변수)