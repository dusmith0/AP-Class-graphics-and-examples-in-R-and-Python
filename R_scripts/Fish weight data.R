###This script is used to generate a random sample of data from the swiss data set.
###It also extracts the data to the clipboard for use in class.
library("clipr")

x <- c(5.2,8.5,11.5,14.3,16.8,19.2,21.3,23.3, 25.0,26.7,28.2,29.6,30.8,32,33,34,34.9,36.4,37.1,37.7)
y <- c(2,8,21,38,69,117,148,190,264,293,318,371,455,504,518,537,651,719,726,810)
data <- rbind(x,y)
write_clip(data)

## ordinary lm
line1 <- lm(y ~ x)
summary(line1)
plot(line1)
plot(y ~ x)
abline(line1)

## Cube root test on x
x_cube <- x ^ (3)
line2 <- lm(y ~ x_cube)
summary(line2)
plot(line2)
plot(y ~ x_cube)
abline(line2)

## Log transformation
x_log <- log(x)
y_log <- log(y)
line3 <- lm(y_log ~ x_log)
summary(line3)
plot(line3)
plot(y_log ~ x_log)
abline(line3)


## compairing
par(mfrow = c(2,3))

plot(y ~ x)
abline(line1)

plot(y ~ x_cube)
abline(line2)

plot(y_log ~ x_log)
abline(line3)

plot(line1$residual)
plot(line2$residual)
plot(line3$residual)
