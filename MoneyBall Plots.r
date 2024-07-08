#####This code is to create graphics for the MoneyBall 2021 Baseball data and pay.

###Note the txt file needs to be set up correctly (i.e. only one tab between the values), and set to your computer.

pay<-data.frame(read.csv("C:/Users/dustin.smith/Documents/Codes/R/AP Statistics/Moneyball(titled).txt",sep="\t"))
View(pay)
#### To make the file easy to access, and change values to numeric
pay$Total_Pay<-as.numeric(gsub('[$,]','',pay$Total_Pay))
pay$Injured_Reserve<-as.numeric(gsub('[$,]','',pay$Injured_Reserve))
pay$Retained<-as.numeric(gsub('[$,]','',pay$Retained))
pay$Buried<-as.numeric(gsub('[$,]','',pay$Buried))
attach(pay)

####Creating the Plots: Has not been beautified...

#par(mfrow=c(2,2))#
plot(WinPer,Total_Pay)
abline(lm(Total_Pay~WinPer))

lm(Total_Pay~Rank)
