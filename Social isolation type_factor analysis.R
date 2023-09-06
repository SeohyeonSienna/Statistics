subject <-data.frame(second$p02j23,
                     second$p02j25, 
                     second$p02j27, 
                     second$p02j29, 
                     second$p02j31, 
                     second$p02j33, 
                     second$p02j35,
                     second$p02j2q2, 
                     second$p02j2q3, 
                     second$p02j2q4, 
                     second$p02j2q5, 
                     second$p02j2q6, 
                     second$p02j2q7, 
                     second$p02j2q8, 
                     second$p02j2q9, 
                     second$p02j2q10, 
                     second$p02j2q11, 
                     second$p02j2q12, 
                     second$p02j2q13, 
                     second$p02j2q14, 
                     second$p02j2q15, 
                     second$p02j2q16, 
                     second$p02j2q17,
                     second$p02j2q19, 
                     second$p02j2q20, 
                     second$p02j2q21)

library(psych)
fa.parallel(subject, fm="ml", fa="fa", n.iter=100)
#스크리도표
library(nFactors)
nScree(subject)
#아이겐 고유값 구하기
eigen(cor(subject))
#요인분석 수행하기(요인적재값)
fa <- factanal(subject, factors=5, scores="regression")
fa$loadings
print(fa$loadings, cutoff=0.001)
#공통성 구하기
round(1 - fa$uniquenesses, 3)
loadings가 요인적재값
#요인점수
fa.scores <- fa$scores
fa.scores

#요인분석 결과 변수 저장
neg_exp_ties <- data.frame(second$p02j2q3,
                           second$p02j2q4, 
                           second$p02j2q5, 
                           second$p02j2q8, 
                           second$p02j2q9, 
                           second$p02j2q12, 
                           second$p02j2q13, 
                           second$p02j2q14, 
                           second$p02j2q15, 
                           second$p02j2q19)

pos_exp_ties_b <- data.frame(second$p02j2q2, 
                             second$p02j2q6, 
                             second$p02j2q7, 
                             second$p02j2q10, 
                             second$p02j2q11)
ins_ties_d <- data.frame(second$p02j27, second$p02j29, second$p02j35)

ins_ties_e <- data.frame(second$p02j23,
                         second$p02j25, 
                         second$p02j31)

pos_exp_ties_s <- data.frame(second$p02j33, 
                             second$p02j2q17,
                             second$p02j2q20, 
                             second$p02j2q21)

#요인분석 결과 데이터 열 추가
newdata <- second %>%
  mutate(f1 = (second$p02j2q3+
                 second$p02j2q4+ 
                 second$p02j2q5+ 
                 second$p02j2q8+ 
                 second$p02j2q9+ 
                 second$p02j2q12+ 
                 second$p02j2q13+ 
                 second$p02j2q14+ 
                 second$p02j2q15+ 
                 second$p02j2q19)/10)

newdata <- newdata %>%
  mutate(f2 = (second$p02j2q2+ 
                 second$p02j2q6+ 
                 second$p02j2q7+ 
                 second$p02j2q10+ 
                 second$p02j2q11)/5)

newdata <- newdata %>%
  mutate(f3 = (second$p02j27+second$p02j29+second$p02j35)/3)

newdata <- newdata %>%
  mutate(f4 = (second$p02j23+
                 second$p02j25+ 
                 second$p02j31)/3)

newdata <- newdata %>%
  mutate(f5 = (second$p02j33+
                 second$p02j2q17+
                 second$p02j2q20+
                 second$p02j2q21)/4)

write.csv(newdata, "D:/newdata.csv")