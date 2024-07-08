### Simple code used to build random samples of old faithful erruption wait times, and eruption lenghts

pdf("C:/Users/dustin.smith/Documents/Codes/R/AP Statistics/faithful data.pdf")
sink("C:/Users/dustin.smith/Documents/Codes/R/AP Statistics/faithful data.csv")
#df <- faithful
print(faithful$waiting)
par(bg="grey90")
hist(faithful$waiting, xlab="Time(min) to wait for eruption",col = "wheat2" )

par(mfrow=c(3,2))
for(i in 1:12){
	samp <- c(sample(faithful$waiting,25))
	hist(samp,xlab="Time(min) to wait for eruption",col = "wheat2")
	print(samp)}

par(bg="grey90")
hist(faithful$eruptions, xlab="Time(min) to wait for eruption",col = "slateblue2" )

par(mfrow=c(3,2))
for(i in 1:12){
	samp <- c(sample(faithful$eruptions,25))
	hist(samp,xlab="Time(min) to wait for eruption",col = "slateblue2",breaks=c(seq(0,5.5,.5)))
	print(samp)}

graphics.off()

### Printing off the data set
library("clipr")

data<-faithful$waiting
data <- matrix(data,ncol=8)
write_clip(data)
plot(density(data))
