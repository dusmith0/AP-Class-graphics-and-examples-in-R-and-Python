###This script is used to generate a random sample of data from the swiss data set.
###It also extracts the data to the clipboard for use in class.
library("clipr")

data<-swiss[sample(1:40,25),]
write_clip(data)
boxplot(data,xlab=c(colnames(swiss))) #really should be cleaned for better use.
