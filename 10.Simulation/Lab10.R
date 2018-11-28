
#The data contains systolic blood pressure for mice with two different genotypes 
#for the D4Mit214 marker. We want to investigate 
#if the systolic blood pressure may be taken to be independent of the genotype. 
#We can attempt to test this by testing if the mean of the two groups are the same.
#This can be done in R with the function t.test().
#load the data
my.data <- read.csv("Lab10.csv")
getwd()
ls()
glimpse(my.data)

data1<-my.data$systolic.bp[my.data$Genotype=="BA"]
data2<-my.data$systolic.bp[my.data$Genotype=="BB"]

data1
data2
#question 3
(testResult <- t.test(data1,data2))

#question 4
par(mfrow=c(1,1))
plot(density(data1),lty = 1, col ="red")
lines(density(data2),lty = 2,col = "blue")

plot(density(data1))
lines(density(data2),col="blue")


#question 5
(n1 <- length(data1))
#question 6
set.seed(554)
sim  <- function() {
  my.new.data<-my.data
  my.new.data$Genotype <- "BB"
  index.temp <- sample(1:50,n1)  
  my.new.data$Genotype[index.temp] <-"BA"
  new.data1 <-my.new.data$systolic.bp[my.new.data$Genotype=="BA"]
  new.data2 <-my.new.data$systolic.bp[my.new.data$Genotype=="BB"]
  t.test(new.data1,new.data2)$statistic
}

my.t.values <- replicate(100000,sim())
tail(my.t.values) 
#density(my.t.values, breaks = 100000)
#my.t.valuescount <- table(length(which(my.t.values > -2.027021)))
my.analysis<-lm(log(Ozone)~Solar.R+Wind+Temp,data=airquality[airquality>1,])
my.t.valuescount <- length(my.t.values[my.t.values> -2.027021])

t.test(0.09756,my.t.values)
summary(testResult)
