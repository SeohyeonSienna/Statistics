상관관계
-1에서 1 사이의 값을 가짐
관측값 단위에 구애받지 않고 상관계수는 항상 일정
피어슨은 연속형 변수(정규성O)/스피어만은 서열형 변수(정규성X)로 이상점에 덜 민감

1. 변수 간 상관계수
cor(데이터$변수, 데이터$변수, use="pairwise.complete.obs")

2. 상관관계의 유의성 검증
with(데이터, cor.test(변수1, 변수2))
더 조건을 추가하자면
with(데이터, cor.test(변수1, 변수2, alternative=greater, conf.level=0.99))

2-1. 상관관계 유의성 검증 시 조건 설정
cor.test(~ 변수1 + 변수 2, data=데이터, subset=(변수=="변수 내 원하는 값"))

3. 상관계수 및 유의성 동시검증
library(psych)
corr.test(데이터셋[-숫자])

4. 상관관계 도표 만들기
library(psych)
pairs.panels(데이터셋, bg="red", pch=21, hist.col="gold",
                 main="Correlation Plot of 데이터셋")

5. 편상관관계
통제변수를 설정하고 상관관계 보는 방법
library(ggm)
pcor(c("변수명", "변수명", "통제변수명", "통제변수명", 
       q=통제변수갯수, n=nrow(데이터셋)))

5-1. 모든 변수 간 편상관관계 계산
library(ppcor)
pcor(데이터셋)

5-2. 특정 두 변수 간 편상관관계수와 유의확률
library(ppcor)
pcor.test(데이터셋["변수명"], 데이터셋["변수명"], 
              데이터셋["통제변수명", "통제변수명"])
