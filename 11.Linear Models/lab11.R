#question 1 quizz1
#We shall regress price on 
#year, temp, h.rain and w.rain with the lm() function. 
#Allow for an interaction between h.rain and w.rain. 

install.packages("UsingR")
library("UsingR")
Sys.setlocale("LC_ALL","English")
load("UsingR")
summary(father.son)
lm(sheight ~ fheight, father.son)

install.packages("R330", dependencies=T)
install.packages("rgl")
library("rgl")
??install.packages
library("R330")
data(wine.df)
str(wine.df)

model<-lm(price ~ year + temp + h.rain + w.rain + h.rain*w.rain, wine.df)
#model1<-lm(price ~  h.rain + h.rain*w.rain, wine.df)
summary(model)
names(summary(model))

#question 4
drop1(model, test = "F")
coef(model)
coef(model)[4]+800*coef(model)[6]

#drop1(model, year + temp + w.rain)
newdata <- subset(wine.df, temp >= mean(wine.df$temp) & h.rain >= mean(wine.df$h.rain) & w.rain >= mean(wine.df$w.rain))
predict(model, temp=mean(wine.df$temp), h.rain=mean(mean(wine.df$h.rain)),w.rain=mean(mean(wine.df$w.rain)))

modellog<-lm(log(price) ~ year + temp + h.rain + w.rain + h.rain*w.rain, wine.df)
drop1(modellog,test="F")
modellog<-update(modellog, ~.-h.rain:w.rain)
summary(modellog)

newset <- data.frame(year=1985, temp=mean(wine.df$temp), h.rain=mean(wine.df$h.rain), w.rain=mean(wine.df$w.rain))
exp(predict(modellog, newdata = newset))

tput(wine.df)
write.csv(wine.df, file = "wine.csv")
