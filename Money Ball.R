### Money Ball Project Script

## Data of 15 teams from 2023 year.
Teams <- c("SF","BOS","NYM","DET","ARI","KC","TB","OAK",
           "STL","MIL","BAL","SD","ALT","CHC","HOU")
Win_per <- c(.488,.481,.506,.481,.519,.349,.611,.309,
             .543,.568,.623,.506,.642,.512,.556)
Salary <- c(187,182,343,121,119,96,80,62,153,125,71,256,206,188,237)
Bunts <- c(39,35,36,31,43,58,38,36,37,32,47,44,43,52,40)
HR <- c(174,182,219,165,165,163,230,171,210,165,183,205,307,196,222)

data <- data.frame(Teams,Win_per,Salary,Bunts,HR)

mean(Win_per)
mean(Salary)
mean(Bunts)
mean(HR)

summary(lm(data$Win_per ~ data$Salary))
plot(lm(data$Win_per ~ data$Salary))
plot(data$Win_per ~ data$Salary)
abline(lm(data$Win_per ~ data$Salary))


summary(lm(data$Win_per ~ data$Bunts))
plot(lm(data$Win_per ~ data$Bunts))
plot(data$Win_per ~ data$Bunts)
abline(lm(data$Win_per ~ data$Bunts))


sqrt(.03154)
sqrt(.3367)
sqrt(.01714)
qt(.975,13)
.0002 + c(-1,1)*2.16*.03154
.00138 + c(-1,1)*2.16*.0005375


