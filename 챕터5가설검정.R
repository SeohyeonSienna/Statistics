챕터 5. 독립성검정과 적합성검정
독립성검정: 두 범주형 변수 간 관련성 모집단에서 존재하는지 검정
적합성 검정: 범주별 빈도 바탕으로 모집단에서 기대되는 비율 분포가 존재하는지

1. 카이제곱검정
범주형 변수간 관련성 확인
1-1) 범주형변수 나누기
survivors <- matrix(c(1, 2, 3, 4, 5, 6), ncol=2)
dimnames(survivors) <- list("Status"=c("이름", "이름", "이름"),
                            "Seatbelt"=c("이름", "이름", "이름"))
survivors

addmargins(survivors)

addmargins(prop.table(addmargins(survivors, 2), 2), 1)

2. 독립성검정
두 범주형 변수가 서로 독립인지 검정
0.05보다 p값이 작아야 관계가 있다
 Titanic.margin <- margin.table(Titanic, margin=c(4, 1))
Titanic.margin
chisq.test(Titanic.margin)

모자이크 도표, 관련성 강도

데이터프레임일 때는 chisq.test(데이터셋$변수, 데이터셋$변수)

3. 적합성검정
범주형 변수가 하나일 때 범주별 비율 분포 가설 검정

작년 분포와 올해 분포 비교: 0.05보다 작아야 차이 있다다
작년
oc <- c(a회사 작년 인원, b회사 작년 인원, c회사 작년 인원)
null.p <- c(전문가가 주장하는 비율, 전문가가 주장하는 비율, 전문가가 주장하는 비율)
chisq.test(oc, p=null.p)

올해
chisq.test(oc, p=c(a회사 올해 인원, b회사 올해 인원, c회사 올해 인원)/전체인원)
