챕터2. 가설검정과 확률분포
데이터의 정규성 검정: 0.05보다 커야함
set.seed(123)
shapiro.test(rnorm(표본데이터수, mean=, sd=))

set.seed(123)
qqnorm((rnorm(표본데이터수, mean=, sd=), col="blue",
        main="")
qqline(rnorm(100, mean=100, sd=15))