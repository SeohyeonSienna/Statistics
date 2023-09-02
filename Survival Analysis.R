챕터 11. 생존분석
생존시간
- 사건이 발생할 때까지 걸리는 시간, 특정 시작 시점부터 사건이 발생하는
종료 시점까지의 시간 측정한 데이터
- 일반적으로 오른쪽 꼬리가 긴 분포로 정규분포 띠지 않음
- 중도절단데이터 사용; 생존분석 특유의 결측값, 관측된 기간 동안 분석대상에게
사건 발생하지 않은 경우 = 모름, 생존
- 결과변수로 생존함수와 위험함수가 있음. 

1. 카플란-마이어 분석
누적생존비율 구함
중도절단데이터는 생존자수에 포함 x, 생존비율 계산에 영향 x
중요! 모든 생존시간 오름차순 정렬!
집단 간 생존함수 비교는 로그 순위 검정 사용

library(survival)
data()
str()

1-1) Surv 객체 생성하기
Surv(time=데이터셋$생존시간변수, event=데이터셋$사건발생상태변수)
class(Surv(데이터셋$생존시간변수, 데이터셋$사건발생상태변수))

1-2) 카플란-마이어 분석 수행하기
km.fit <- survfit(Surv(생존시간변수, 사건발생변수)~1, data=데이터셋)
km.fit
names(km.fit) : 함수 내 볼 수 있는 정보 리스트

1-3) 카플란-마이어 분석 결과 보기
생존자수 = n.risk, 사망자수 = n.event, 중도절단 개수 = n.censor, 각 시점 생존확률 =surv
km.df <- data.frame(time= km.fit$time, n.risk= km.fit$ n.risk, n.event= km.fit$n.event, 
                    n.censor= km.fit$n.censor, surv= km.fit$surv, 
                    upper= km.fit$upper, lower= km.fit$lower)
head(km.df)

특정 시점까지 생존활 확률
summary(km.fit, times=c(180, 360))

평균 생존시간:median
km.fit

임의의 생존확률에 대응되는 생존시간
quantile(km.fit, probs=1-c(0.7, 0.3))
앞이 30% 죽었을 때를 의미함

1-4) 생존함수곡선 그리기
library(survminer)
ggsurvplot(km.fit, xlab="Days", ylab="Overall Survival Probability")

1-5) 집단 간 생존시간 비교하기
km.group <- survfit(Surv(시간변수, 사건발생변수) ~ 집단변수, data = 데이터셋)
km.group

summary(km.group)
summary(km.group)$table
summary(km.group, times=c( , ))

1-6) 집단 간 생존시간 차이 통계적으로 검정하기
survdiff(Surv(시간변수, 사건변수) ~ 집단변수(+로 이을 수 있음), data = 데이터셋)

1-7) 집단 별 생존함수곡선 그리기
ggsurvplot(km.group, pval=TRUE, conf.int=TRUE,
           risk.table="absolute", risk.table.col="strata",
           linetype="strata", surv.median.line="hv",
           ggtheme=theme_bw(), palette=c("royalblue", "salmon"), 
           xlim=c(0, 범위지정))

1-8) 집단 별 누적사건곡선 그리기; 특정시점까지 사망할 확률
ggsurvplot(km.group, pval=TRUE, conf.int=TRUE,
           risk.table.col="strata",
           linetype="strata",
           ggtheme=theme_bw(), palette=c("royalblue", "salmon"), fun="event",
           xlim=c(0, 범위지정))

1-9) 집단별 누적위험함수곡선 그리기; 누적사망률
ggsurvplot(km.group, conf.int=TRUE,
          risk.table.col="strata",
           linetype="strata",
           ggtheme=theme_bw(), palette=c("royalblue", "salmon"), fun="cumhaz"
           xlim=c(0, 범위지정))

1-10) 집단변수가 2개 이상인 경우에 생존함수곡선 그리기
ggsurv <- ggsurvplot(km.fit, conf.int=TRUE, conf.int.style="step",
                     ggtheme=theme_bw())
ggsurv$plot + theme_bw() + theme(legend.position="right", 
                                 legend.title=element_blank())+
  facet_grid(집단변수2 ~ 집단변수3, labeller=label_both)


2. 콕스회귀분석
범주형 변수가 아닌 연속형 변수가 생존에 미치는 영향도 볼 수 있음
cox <- coxph(Surv(시간변수, 사건변수) ~ 영향 주는 변수, data = 데이터셋)
summary(cox)

2-1) 콕스회귀분석 위험비도표
library(survminer)
ggforest(cox, data=데이터셋)

2-2) 예측변수들이 모두 평균일 때 생존비율 예측하기
cox.fit <- survfit(cox, data = )
cox.fit

2-3) 생존비율 예측값 생존함수곡선으로 나타내기
ggsurvplot(cox.fit, palette="cornflowerblue", ggtheme=theme_minimal(),
           legend="none", xlab="Days", ylab="Overall Survial Probability")

2-4) 예측변수의 값이 변화할 때의 생존확률 알아보기
고정하고싶은변수.df <- with(data,
                    data.frame(sex=c("male", "female"),
                               age=rep(mean(age, na.rm=TRUE), 2),
                               ph.ecog=rep(mean(ph.ecog, na.rm=TRUE), 2)))
고정하고싶은변수.df
고정하고싶은변수.fit <- survfit(cox, newdata=고정하고싶은변수.df, data= )
ggsurvplot(고정하고싶은변수.fit, conf.int=FALSE, ggtheme=theme_minimal(),
                   legend.labs=c("Male", "Female"), legend.title="",
                   xlab="Days", ylab="Survival Probability")

2-5) 예측변수의 값이 여러개일 때 생존확률 알아보기
고정하고싶은변수.df <- with(data,
                    data.frame(sex=rep("male", 4),
                               age=rep(mean(age, na.rm=TRUE), 4),
                               ph.ecog=c(0, 1, 2, 3)))
고정하고싶은변수.df
고정하고싶은변수.fit <- survfit(cox, newdata=고정하고싶은변수.df, data= )
ggsurvplot(고정하고싶은변수.fit, conf.int=FALSE, ggtheme=theme_minimal(),
                   legend.labs=c(0:3), legend.title="ECOG Performance Score",
                   xlab="Days", ylab="Survival Probability")
