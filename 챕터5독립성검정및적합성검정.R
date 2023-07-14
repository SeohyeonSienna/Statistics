Chapter.5 독립성 검정과 적합성 검정

1. 카이제곱검정
카이제곱: (관측빈도 - 기대빈도)제곱/기대빈도
자유도: 행 갯 수- 1 * 열 갯수 - 1

pchisq(카이제곱값, df=자유도, lower.tail=FALSE)

2. 독립성 검정

chisq.test(데이터프레임$원하는행, 데이터프레임$원하는열)

3. 적합성 검정

chisq.test(c(, , ,))

oc <- c(, , ,)
null.p <- c(0.45, ...)
chisq.test(oc, p=null.p)

chisq.test(oc, p=c( , , ,)/N)


