install.packages('psych')
library(psych)
describe(twopublic[c("innov", "culture", "lead", "concent")])

corr.test(twopublic[c("innov", "culture", "concent", "mlead")])
print(corr.test(twopublic[c("innov", "culture", "concent", "mlead")]), short=FALSE)
pairs.panels(twopublic[c("innov", "culture", "concent", "mlead")], bg="red", pch=21, 
             hist.col="gold", main="")


model.total <- lm(innov ~ culture, data=twopublic)
summary(model.total)
model.m <- lm(concent ~ culture, data=twopublic)
summary(model.m)
model.y <- lm(innov ~ culture + concent, data=twopublic)
summary(model.y)

library(mediation)
set.seed(123)
model.M <- lm(concent ~ culture, data=ppublic)
model.Y <- lm(innov ~ culture + concent, data=ppublic)
model.mediation <- mediate(model.m=model.M, model.y=model.Y, treat="culture", 
                           mediator="concent", boot=TRUE, sims=500)
summary(model.mediation)


public.lm <- lm(innov ~ culture*mlead, data=twopublic)
summary(public.lm)

public.lm2 <- lm(concent ~ culture*mlead, data=twopublic)
summary(public.lm2)

public.lm3 <- lm(innov ~ culture*mlead + concent*mlead, data=twopublic)
summary(public.lm3)

library(rockchalk)
plotSlopes(model=public.lm, plotx="혁신조직문화", modx="혁신행동", modxVals="std.dev",
           pch=21, col=rainbow(3), cex=1, bg="dimgray",
           main="")

set.seed(123)
model.A <- lm(concent ~ culture*mlead, data=twopublic)
model.B <- lm(innov ~ culture*mlead + concent*mlead, data=twopublic)
model.med1 <- mediate(model.m=model.A, model.y=model.B, 
                      covariates=list("mlead"=-1), treat="culture", 
                      mediator="concent", boot=TRUE, sims=500)
summary(model.med1)

model.A <- lm(concent ~ culture*mlead, data=twopublic)
model.B <- lm(innov ~ culture*mlead + concent*mlead, data=twopublic)
model.med2 <- mediate(model.m=model.A, model.y=model.B, 
                      covariates=list("mlead"=1), treat="culture", 
                      mediator="concent", boot=TRUE, sims=500)
summary(model.med2)

set.seed(12)
model.med <- mediate(model.m=model.A, model.y=model.B, 
                     treat="culture", mediator="concent", sims=500)
set.seed(12)
test.modmed(object=model.med, covariates.1=list("mlead"=1),
            covariates.2=list("mlead"=-1), sims=500)

#Graph showing Moderation effect of transformative leadership

two.lm <- lm(innov ~ culture + lead + culture:lead, 
             data=twopublic)
summary(two.lm)


library(effects)
m <- round(mean(twopublic$lead), 1); m
s <- round(sd(twopublic$lead), 1); s
plot(effect(term="culture:lead", mod=two.lm, 
            xlevels=list(lead=c(m-s, m, m+s))), 
     lines=list(multiline=TRUE, lwd=2, lty=c(3, 2, 1),
                col=c("royalblue", "violet", "maroon")),
     main="상호작용도표")