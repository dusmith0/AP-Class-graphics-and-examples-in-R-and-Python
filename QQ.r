#### This code is used to compair verious QQ plots with their histograms.
#### This is used for AP Statistics

## This is the location of where I stored my files, to print a pdf of the data.
rm(list=ls())
pdf("C:/Users/dustin.smith/Documents/Codes/R/AP Statistics/QQ_plots.pdf",11,8.5)


## This is a function to generate the graphics, with only 'data' as the needed input.
## The data is generated below
plot_QQ <- function(data){
n = length(data)
i = seq(1:n)
u=(i-.5)/n
z=sort(qnorm(u))

par(mfrow=c(1,3))
plot(z,sort(data),xlab="Perfect Normal",ylab="Data's Values",main="QQ Plot",col="blue")
abline(lm(sort(data)~z),col="red")

plot(density(data),main="Estimated Histogram of the data", col="red")
lines(x<-seq(-3.5,3.5,.01),dnorm(x),col="Blue",cex=2) #Note this will fail if the data is not centered around one. Which it will not be many times.

#This is a quick fix for the problem above. Not a good fix though.
hist(data, main="Actual Histogram of the data")
}

### Here are some random data points to apply with the function.
## I would not suggest changing the sample size to more than 100, as the graph
## becomes very difficult to read.
data <- rnorm(10)
plot_QQ(data)
data <- rnorm(100)
plot_QQ(data)
data <- rnorm(1000)
plot_QQ(data)
data <- rbeta(100,1,.1)
plot_QQ(data)
data <- rbinom(100,100,.2)
plot_QQ(data)
data <- rbinom(100,100,.8)
plot_QQ(data)
data <- rgamma(100,1,1)
plot_QQ(data)
data <- runif(100,-3,3)
plot_QQ(data)

#This exits the code and sends the graphs to your designated files
graphics.off()
