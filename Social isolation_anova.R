library(gmodels)
newdata
newdata$`community detection`
frqtab <- table(newdata$`community detection`)
frqtab

cd <- as.factor(x=newdata$`community detection`)

newnewdata <- newdata %>%
  mutate(cd = cd)

#cd에 따른 anova
aov <- aov(p02j51
           ~cd, data=newnewdata)
summary(aov)
model.tables(aov, type="mean")
compare <- TukeyHSD(aov)
compare

plotmeans(p02j51~cd, data=newnewdata, barcol="tomato", barwidth=3, 
              col="cornflowerblue", lwd=2,
              xlab="관계 유형", ylab="평균", 
              main="먹고 싶지 않고 식욕이 없다")

plotmeans(p02j52~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="비교적 잘 지냈다")

plotmeans(p02j53~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균",
          main="상당히 우울했다")

plotmeans(p02j54~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="모든 일이 힘들게 느껴졌다")

plotmeans(p02j55~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="잠을 설쳤다")

plotmeans(p02j56~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="세상에 홀로 있는 듯한 외로움을 느꼈다")

plotmeans(p02j57~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="큰 불만 없이 생활했다")

plotmeans(p02j58~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="사람들이 나에게 차갑게 대하는 것 같았다")

plotmeans(p02j59~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="마음이 슬펐다")

plotmeans(p02j60~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="사람들이 나를 싫어하는 것 같았다")

plotmeans(p02j61~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="도무지 월 해 나갈 엄두가 나지 않았다")

plotmeans(p02j61~cd, data=newnewdata, barcol="tomato", barwidth=3, 
          col="cornflowerblue", lwd=2,
          xlab="관계 유형", ylab="평균", 
          main="도무지 월 해 나갈 엄두가 나지 않았다")

write.csv(newnewdata, file = "D:/DATAFIANL.csv")

p02j51.aov <- aov(p02j51~cd, data=newnewdata)
p02j51.aov
summary(p02j51.aov)
model.tables(p02j51.aov, type="mean")


p02j51.compare <- TukeyHSD(p02j51.aov)
p02j51.compare


# question K
newdata_without_na <- na.omit(newdata)

a1 <- as.factor(x=newdata$p02k1)
a2 <- as.factor(x=newdata$p02k4)
a3 <- as.factor(x=newdata$p02k2q1)
a4 <- as.factor(x=newdata$p02k7)
a5 <- as.factor(x=newdata$p02k9)
a6 <- as.factor(x=newdata$p02k11)
a7 <- as.factor(x=newdata$p02k13)
a8 <- as.factor(x=newdata$p02k2q2)
a9 <- as.factor(x=newdata$p02k2q3)
a10 <- as.factor(x=newdata$p02k2q4)
a11 <- as.factor(x=newdata$p02k14)

b1 <- as.factor(x=newdata_without_na$p02k19)
b2 <- as.factor(x=newdata_without_na$p02k2q5)
b3 <- as.factor(x=newdata_without_na$p02k22)
b4 <- as.factor(x=newdata_without_na$p02k24)
b5 <- as.factor(x=newdata_without_na$p02k26)
b6 <- as.factor(x=newdata_without_na$p02k28)
b7 <- as.factor(x=newdata_without_na$p02k2q6)
b8 <- as.factor(x=newdata_without_na$p02k2q7)
b9 <- as.factor(x=newdata_without_na$p02k2q8)
b10 <- as.factor(x=newdata_without_na$p02k29)
b11 <- as.factor(x=newdata_without_na$p02k16)

c1 <- as.factor(x=newdata$p02k31)
c2 <- as.factor(x=newdata$p02k34)
c3 <- as.factor(x=newdata$p02k2q20)
c4 <- as.factor(x=newdata$p02k37)
c5 <- as.factor(x=newdata$p02k39)
c6 <- as.factor(x=newdata$p02k41)
c7 <- as.factor(x=newdata$p02k43)
c8 <- as.factor(x=newdata$p02k2q21)
c9 <- as.factor(x=newdata$p02k2q22)
c10 <- as.factor(x=newdata$p02k2q23)
c11 <- as.factor(x=newdata$p02k44)

d1 <- as.factor(x=newdata$p02k46)
d2 <- as.factor(x=newdata$p02k47)
d3 <- as.factor(x=newdata$p02k48)
d4 <- as.factor(x=newdata$p02k49)
d5 <- as.factor(x=newdata$p02k50)
d6 <- as.factor(x=newdata$p02k51)

e1 <- as.factor(x=newdata_without_na$p02k52)
e2 <- as.factor(x=newdata_without_na$p02k53)
e3 <- as.factor(x=newdata_without_na$p02k54)
e4 <- as.factor(x=newdata_without_na$p02k55)
e5 <- as.factor(x=newdata_without_na$p02k56)
e6 <- as.factor(x=newdata_without_na$p02k57)

f1 <- as.factor(x=newdata_without_na$p02k2q24)
f2 <- as.factor(x=newdata_without_na$p02k2q25)
f3 <- as.factor(x=newdata_without_na$p02k2q26)
f4 <- as.factor(x=newdata_without_na$p02k2q27)
f5 <- as.factor(x=newdata_without_na$p02k2q28)
f6 <- as.factor(x=newdata_without_na$p02k2q29)

g1 <- as.factor(x=newdata$p02k64_1)
g2 <- as.factor(x=newdata$p02k64_2)

# 카이제곱
library(gmodels)
CrossTable(newnewdata$cd, d6, chisq = TRUE)
CrossTable(newdata_without_na$cd, f6, chisq = TRUE)

#결측치 처리 안해도 되는
for (i in 1:2) {
  b_variable <- get(paste("g", i, sep = ""))  # 변수 추출
  result <- CrossTable(newnewdata$cd, b_variable, chisq = TRUE)
  print(result)
}

#결측치 처리해야하는
for (i in 1:6) {
  b_variable <- get(paste("f", i, sep = ""))  # 변수 추출
  result <- CrossTable(newdata_without_na$cd, b_variable, chisq = TRUE)
  print(result)
}

t1 <- as.numeric(x = newdata_without_na$p02k2q9)
t2 <- as.numeric(x = newdata_without_na$p02k2q10)
t3 <- as.numeric(x = newdata_without_na$p02k2q11)
t4 <- as.numeric(x = newdata_without_na$p02k2q12)
t5 <- as.numeric(x = newdata_without_na$p02k2q13)
t6 <- as.numeric(x = newdata_without_na$p02k2q14)
t7 <- as.numeric(x = newdata_without_na$p02k2q15)
t8 <- as.numeric(x = newdata_without_na$p02k2q16)
t9 <- as.numeric(x = newdata_without_na$p02k2q17)
t10 <- as.numeric(x = newdata_without_na$p02k2q18)
t11 <- as.numeric(x = newdata_without_na$p02k2q19)

any(is.na(newdata$p02k2q9))

foranovadata <- newdata_without_na %>%
  mutate(t1 = t1, t2 = t2, t3 = t3, t4 = t4, t5 = t5,
         t6 = t6,
         t7 = t7, t8 = t8, t9 = t9, t10 = t10, t11 = t11)

#결측치 제외자료 아노바
aov <- aov(t11~cd, data=foranovadata)
summary(aov)
model.tables(aov, type="mean")
