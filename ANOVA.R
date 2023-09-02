챕터4 분산분석
1. 여러 집단 간 평균의 차이 표로 나타내기
tapply(데이터$종속변수, 데이터$그룹변수, mean)
tapply(데이터$종속변수, 데이터$그룹변수, sd)
tapply(데이터$종속변수, 데이터$그룹변수, length)
library(gplots)
plotmeans(종속변수~그룹변수, data=데이터, barcol="tomato", barwidth=3, 
              col="cornflowerblue", lwd=2,
              xlab="x축이름", ylab="y축이름", 
              main="그래프제목(거꾸로슬래쉬n은 밑으로 보내는 의미)")

2-1. 분산분석 기초_정규성 검정과 아웃라이어 검정_둘다 0.05보다 커야 문제없음
shapiro.test(데이터$종속변수)
outlierTest(그룹변수.aov)

2-2. 분산분석 기초_집단 간 분산 동일성여부 검증_0.05보다 커야 문제없음
leveneTest(종속변수~그룹변수, data=데이터)

3. 일원분산분석+다중비교
그룹변수.aov <- aov(종속변수~그룹변수, data=데이터)
그룹변수.aov
summary(그룹변수.aov)
model.tables(그룹변수.aov, type="mean")

3-1.일원분산분석+사후분석
그룹변수.compare <- TukeyHSD(그룹변수.aov)
그룹변수.compare

3-2.집단간분산이동일하지않은일원분산분석+사후분석


4.이원분산분석+다중비교+사후분석비교
데이터.aov <- aov(종속변수 ~ 그룹변수1*그룹변수2, data=데이터)
데이터.aov
summary(데이터.aov)
model.tables(데이터.aov, type="mean")
TukeyHSD(데이터.aov)

4-1.이원분산분석 상자도표
boxplot(종속변수~그룹변수1*그룹변수2, data=데이터,
            col=c("deeppink", "yellowgreen", las=1,
                  xlab="x축이름", ylab="y축이름",
                  main="표이름"))

4-2. 이원분산분석 상호작용도표
interaction.plot(x.factor=데이터$x축집단변수, trace.factor=데이터$그래프상집단변수,
                 response=데이터$종속변수, las=1, type="b",
                 pch=c(1, 19), col=c("blue", "red"), trace.label="그래프상집단변수이름",
                 xlab="x축집단변수이름", ylab="y축종속변수이름",
                 main="표이름")

4-3. 이원분산분석 평균도표
library(glpots)
plotmeans(종속변수!interaction(그룹변수, 그룹변수, sep=" "), data=데이터,
              connect=list(c(1,3,5), c(2,4,6)),
              col=c("red", "green3"),
              xlab=" ", ylab="",
              main="")

4-4. 이원분산분석 상자도표와선도표
library(HH)
interaction2wt(종속변수~그룹변수*그룹변수,  data=데이터)

5. 공변량분석
데이터.aov <- aov(종속변수~cpa+독립변수, data=데이터)
데이터.aov
공변량 제거 후 평균
effect("독립변수", 데이터.aov)

5-1. 공변량분석
library(HH)
ancova(종속변수~cpa+독립변수, data=데이터)

