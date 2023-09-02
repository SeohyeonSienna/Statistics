챕터 10. 군집분석
관측된 특성이나 설문의 응답을 바탕으로 서로 유사한 특성을 지니거나
유사한 답변을 한 케이스들을 동일한 집단으로 분류하는 것

1. 유사도 측정
유사도 = 케이스 간 거리
주로 유클리드 거리가 사용됨; 유클리드 거리는 연속형 변수일 때 사용
자기 자신과의 거리는 0

1-1) 연속형 변수만 있는 경우에 거리측정하기
d <- dist(데이터셋)
class(d)
labels(d)
as.matrix(d)[행(1:), 열(1:)]

1-2) 변수 유형이 혼재될 때 거리측정하기
library(cluster)
d <- daisy(데이터, metric="gower")
as.matrix(d)[행(1:), 열(1:)]

2. 계층적 군집분석
모든 케이스가 하나의 군집을 형성하다 최종 한 개의 군집이 남을 때까지 더해감
연결법은 5가지가 있음

변수 이름 소문자로 변경하고 표준화하기
이름 <- 데이터셋
row.names(이름) <- tolower(row.names(이름))
이름.scaled <- scale(이름)

2-1) 계층적 군집분석 수행하기
d <- dist(이름.scaled)
clustering.average <- hclust(d, method="")
method에는 single(단일), centroid(중심), ward.D(최소분산연결법) 사용가능

2-2) 최적의 군집 개수 찾기
library(NbClust)
nc <- NbClust(이름.scaled, distance="euclidean",
                min.nc=3, max.nc=15, method="average")
nc$Best.nc
table(nc$Best.nc[1,])

2-3) 찾은 군집 개수로 나누기
clusters <- cutree(clustering.average, k=윗줄에서 지지가장많이받은거)
clusters
table(clusters)

2-4) 계층적 군집분석 덴드로그램 그리기
plot(clustering.average, hang=-1, cex=0.9, col="darkgreen",
     xlab="", main="")
rect.hclust(clustering.average, k=5)

2-5) 군집별 특성 알아보기
*기본
aggregate(이름, by=list(cluster=clusters), mean)
*표준화된 값으로 군집별 평균구하기
a <- aggregate(이름.scaled, by=list(cluster=clusters), mean)
n <- as.vector(table(clusters))
cbind(a, n)

3. 분할적 군집분석
군집개수를 미리 설정 안해줘도 됨!
  
1) k-평균 군집분석; 연속형변수만 가능
library(NbClust)
set.seed(123)
nc <- NbClust(이름.scaled, distance="euclidean",
                min.nc=2, max.nc=15, method="kmeans")
table(nc$Best.nc[1,])

set.seed(123)
clustering.km <- kmeans(이름.scaled, centers=군집개수, nstart=25)
clustering.km$cluster
clustering.km$centers
clustering.km$size

aggregate(이름, by=list(cluster=clustering.km$cluster), mean)

library(cluster)
clusplot(x=데이터셋, clus=clustering.km$cluster, color=TRUE, shade=TRUE,
         labels=2, lines=0, main="")

2) PAM 군집분석; 이상점 고려, 혼합변수 가능
중심관측값 = 메도이드 ; 총 비용 최소화하는 메도이드 찾기가 목표

library(cluster)
set.seed(123)
clustering.pam <- pam(데이터셋, k=군집개수, stand=TRUE)

2-1) 중심 메도이드 찾기
clustering.pam$id.med

2-2) 군집 비교하기
aggregate(데이터셋, by=list(cluster=clustering.pam$clustering), mean)

2-3) 군집도표 그리기
library(cluster)
clusplot(clustering.pam, color=TRUE, shade=TRUE,
         labels=4, lines=0, main="")

2-4) 군집결과 정확성 확인하기
result.pam <- table(데이터셋$유형변수, clustering.pam$clustering,
                        dnn=c("Actual", "Clustered"))
result.pam
mean(데이터셋$유형변수==clustering.pam$clustering)

library(flexclust)
randIndex(result.pam)

