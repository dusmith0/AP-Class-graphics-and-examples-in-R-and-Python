n = 30
beginmean = 3565
incmean = 3107

beginsig = 173
incsig = 215

sigma = sqrt(beginsig**2+incsig**2)
mean = beginmean - incmean

R.samples = rep(0,n)

for (i in 1:30){
  R.sample = rnorm(1,mean,sigma)
  R.samples[i] = as.integer(R.sample)
}
print(R.samples)

hist(R.samples,col="blue")
