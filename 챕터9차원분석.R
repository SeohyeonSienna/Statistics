챕터 9. 차원분석
데이터셋의 차원을 축소하는데 의미가 있음

1. 주성분분석
서로 상관관계를 갖는 많은 변수를 상관관계가 없는 소수의 변수로 변환
1-1) 주성분분석
pca <- prcomp(데이터셋, scale=TRUE)
여기서 scale=TRUE는 표준편차 1을 갖도록 표준화함
summary(pca)

1-2) 스크리 도표 그리기
plot(pca, type="1", pch=19, lwd=2, col="red", main="")

1-3) 성분적재값 구하기
round(pca$rotation, 3)

1-4) 성분점수 구하기
round(pca$x, 3)

1-5) 주성분분석 결과 시각화하기(주성분 행렬도=지각도)
biplot(pca, cex=c(0.5, 0.75), main="Biplot")

2. 요인분석
주성분분석과 달리 변수들에 내재되어있는 소수의 요인 찾는 것이 목표
오차 = 요인에 의해서 설명되지 않는 관측변수의 분산
2-1) 추출할 요인의 개수 정하기
방법 1. 고유값(아이겐벡터) 이용하기; 고유값 1보다 커야함
library(psych)
fa.parallel(데이터셋$tab, fm="ml", fa="fa", n.iter=100)
library(nfactors)
nScree(데이터셋$tab)
2-2) 아이겐 고유값 구하기
eigen(cor(데이터셋$tab))
2-3) 요인분석 수행하기(요인적재값)
fa <- factanal(데이터셋$tab, factors= , scores="regression")
fa$loadings
print(fa$loadings, cutoff=0.001)
2-4) 공통성 구하기
round(1 - fa$uniquenesses, 3)
loadings가 요인적재값
2-5) 경로도 그리기
library(semPlot)
semPaths(fa, what="est", residuals=FALSE, 
         cut=0.3, posCol=("white", "darkgreen"), negCol=c("white", "red"),
         edge.label.cex=0.75)
2-6) 요인점수 구하기
fa.scores <- fa$scores
fa.scores
2-7) psych 패키지로 요인분석 하기
library(psych)
fa <- fa(데이터명$tab, nfactors=2, rotate="varimax", fm="ml")
fa
fa$loadings
fa$scores
fa$weights
fa.diagram(fa, simple=FALSE, cut=0.3, digits=2, col="blue",
           adj=2, e.size=0.08, rsize=2)

3. 다차원척도법
케이스 간 유사도를 거리로 판단
