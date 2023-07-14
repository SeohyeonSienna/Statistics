챕터7 더미변수, 매개효과분석, 조절효과분석, 조절매개효과분석

1. 더미변수
더미변수를 이용한 회귀분석 = 일원분산분석
범주형 변수 회귀분석 할 때
0인 범주 = 기준범주
1로 코딩된 범주가 종속변수에 미치는 영향
더미변수 개수는 범주 개수 -1

1) 더미변수 회귀분석 하기
lm함수 => 자동으로 범주형 변수 더미로 변환
데이터명.lm <- lm(종속변수 ~ 범주형변수, data = 데이터셋)
summary(데이터명.lm)

2) 기준 더미 바꾸기
re데이터 <- relevel(데이터셋$변수, ref=원하는집단번호)
데이터명.lm <- lm(종속변수 ~ re데이터, data = 데이터셋)
summary(데이터명.lm)

2. 매개효과분석
aka 간접효과; X가 Y에 미치는 영향이 M을 통해 작동하는가?
총효과 = 직접효과 + 간접효과, 직접효과 0일시 완전매개

1) 매개효과 분석하기
1단계 X -> Y
model.total <- lm(종속변수 ~ 독립변수, data = 데이터셋)
summary(model.total)

2단계 X -> M
model.M <- lm(매개변수 ~ 독립변수, data = 데이터셋)
summary(model.M)

3단계 X,M -> Y
model.Y <- lm(종속변수 ~ 독립변수 + 매개변수, data = 데이터셋)
summary(model.Y)

2) 매개효과 통계적 유의성 검증하기
소벨검정
library(multilevel)
model.sob <- sobel(pred=데이터셋$독립변수, med=데이터셋$매개변수, 
                   out=데이터셋$종속변수)
model.sob
pnorms(abs(model.sob$z.value), lower.tail=FALSE)*2

부트스트랩
library(mediation)
set.seed(123)
model.M <- lm(매개변수 ~ 독립변수, data = 데이터)
model.Y <- lm(종속변수 ~ 독립변수 + 매개변수, data = 데이터셋)
model.mediation <- mediate(model.m=model.M, model.y=model.Y,
                           treat="독립변수", mediator="매개변수",
                           boot=TRUE, sims=500)
summary(model.mediation)
plot.mediate(model.mediation, cex=1.2, col="royalblue", lwd=2,
             main="제목")

3. 조절효과분석
1) 조절효과
데이터명.lm <- lm(종속변수 ~ 독립변수 + 조절변수 + 독립:조절, 
                  data=데이터셋)
summary(데이터명.lm)

2) 조절효과 상호작용 그래프
library(effects)
m <- round(mean(데이터셋$조절변수), 1); m
s <- round(sd(데이터셋$조절변수), 1); s
plot(effect(term="독립변수:조절변수", mod=m.lm, 
            xlevels=list(com=c(m-s, m, m+s))), 
     lines=list(multiline=TRUE, lwd=2, lty=c(3, 2, 1),
                col=c("royalblue", "violet", "maroon")),
     main="상호작용도표")

4. 조절매개효과분석
1) 매개된조절효과 회귀분석
model.A <- lm(매개변수 ~ 독립변수*조절변수, data = 데이터셋)
model.B <- lm(종속변수 ~ 독립변수*조절변수, 매개변수*조절변수, 
                  data = 데이터셋)
set.seed(12)
model.med1 <- mediate(model.m=model.A, model.y=model.B, 
                      covariates=list("조절변수"=조절변수집단숫자), 
                      treat="독립변수", 
                      mediator="매개변수", boot=TRUE, sims=500)
summary(model.med1)
set.seed(12)
model.med2 <- mediate(model.m=model.A, model.y=model.B, 
                      covariates=list("조절변수"=조절변수집단숫자), 
                      treat="독립변수", 
                      mediator="매개변수", boot=TRUE, sims=500)
summary(model.med2)

2) 매개된조절효과 간접효과 통계적 유의성 검증
set.seed(12)
model.med <- mediate(model.m=model.A, model.y=model.B, 
                     treat="독립변수", mediator="매개변수", sims=500)
set.seed(12)
test.modmed(object=model.med, covariates.1=list("조절변수"=1),
            covariates.2=list("조절변수"=-1), sims=500)
