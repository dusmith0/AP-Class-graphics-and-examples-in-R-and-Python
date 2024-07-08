### AP Stats
### Intro set of interesting data to demonstrate what Statistics can do
rm(list=ls())
library("MASS")
install.packages("car")
library("car")

###Data pulled from Texas A&M
seed<-c(151,450,124,235,357,110,302,671,118,115,275,275,2550,243,201,199,130,119,92,91,92,98,
        1650,1200,1180,900,700,460,340,330)
unseed<-c(246,268,275,348,305,311,206,279,426,269,257,299,337,329,319,312,327,342,351,205,151,
	426,154,353,396,441,254,263,278,281)

###Resampling the data to produced reduced different data
#not sure if this is legal???

seed<-sample(seed,15,replace=FALSE)
unseed<-sample(unseed,15,replace=FALSE)

seed<-c(130,199,1200,92,115,235,119,700,110,900,275,124,151,201,340)
unseed<-c(396,278,254,342,312,319,426,151,426,263,441,246,351,257,311)

###Ingornant Estimate and tests
ms<-mean(seed)
msd<-sd(seed)
mu<-mean(unseed)
usd<-sd(unseed)

sp<-sqrt((14*(ms^2+mu^2)/(15+15-2)))

##non-pooled
(test<-(ms-mu)/sqrt(msd^2/15+usd^2/15))
2*pt(test,15+15-2,lower.tail=FALSE)

##pooled
(test<-(ms-mu)/(sp*sqrt(1/15+1/15)))
2*pt(test,15+15-2,lower.tail=FALSE)

###Printing the data
library("clipr")
write_clip(rbind(seed,unseed))

###Assessing the data
n<-length(seed)
m<-length(unseed)
par(mfrow=c(1,2),col="wheat")
plot(density(seed),col="Blue",cex=2,main="Kernal Density Estimator\nSeed") #Non-normal. Strong skewness
plot(density(unseed),col="Blue",cex=2,main="Kernal Density Estimator\nUnseed") #Almost Normal

##QQs Shapiro.tests
n = length(seed)
i = seq(1:n)
u=(i-.5)/n
z=sort(qnorm(u))

par(mfrow=c(1,2))
plot(z,sort(seed),xlab="Normal",ylab="seed",main="QQ for Seeded data")
abline(lm(sort(seed)~z))

plot(z,sort(unseed),xlab="Normal",ylab="unseeded",main="QQ for Unseeded data")
abline(lm(sort(unseed)~z))

shapiro.test(seed) #unacceptable test not-normal
shapiro.test(unseed)

###Transformation for Seeded data
summary(powerTransform(seed))  ##point estimate suggestion = -.7395
tseed<-(seed)^(-.5)
trseed<-(seed)^(-.25)
par(mfrow=c(1,2),col="Blue")

##Transformed QQplots
plot(z,sort(tseed),xlab="Normal",ylab="seed",main="QQ for Seeded data\nTransformed with -1/2")
abline(lm(sort(tseed)~z))

plot(z,sort(trseed),xlab="Normal",ylab="seed",main="QQ for Seeded data\nTransformed with -1/4")
abline(lm(sort(trseed)~z))

shapiro.test(tseed) #slightly better test for the Tr data ^-.5
shapiro.test(trseed) #poor test

###Finding Confidence Intervals
###95/95 Lower Tolerance Intervals
mean(tseed);sd(tseed)/sqrt(n)
(mean(tseed)+2.220*sd(tseed)/sqrt(length(tseed)))^(-2)  ###271

mean(unseed);sd(unseed)/sqrt(m)
(mean(unseed)-2.220*sd(unseed)/sqrt(length(unseed)))   ###139

###Confidence Interval
mean(unseed)+c(1,-1)*(qt(.025,29))*(sd(unseed)/sqrt(length(unseed)))

##Bootstrapped for seeded non-transformed data
est=mean(seed)
B=9999
W=rep(0,time=B)
for(i in 1:B){
	W[i]=mean(sample(seed,replace=TRUE))
	}
Z<-sqrt(n)*(W-est)/sd(seed)
Z<-sort(Z)
LZ<-Z[250]
UZ<-Z[9750]
(est-c(UZ,LZ)*(sd(seed)/sqrt(length(seed))))


###Medians for Skewness comparison
n=15
try<-(1:n)
cov=.95
cov.act<-(pbinom(n-try,n,.5)-pbinom(try+1,n,.5))
r<-max(try[cov.act>=.95])  ##finds r = 2
seed<-sort(seed);unseed<-sort(unseed)
(mids<-c(seed[2],seed[15-2+1]))
(midu<-c(unseed[2],unseed[15-2+1]))

###Non-parametric Test for difference of means.
  ##Wilcoxon test was used
  ##note due to skewness, and ties not being addressed, this test may not be viable
wilcox.test(seed,unseed,alternative="two-sided",paired=FALSE)

#Calculated attempt at test. The above is better for illistrative purposes
list<-c(seed,unseed)
rank<-data.frame(list,rank(list,ties.method="average"));colnames(rank)<-c("data","rank")
Ws<-sum(rank$rank[1:10])
Wu<-sum(rank$rank[11:20])
Ws;Wu

qwilcox(1-.05/2,15,15)+15*(15+1)/2
pwilcox(Ws-15*(15+1)/2,15,14)
