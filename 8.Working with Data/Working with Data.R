# Data frames: adding and removing columns
dat <- data.frame(x=LETTERS[1:3], y=1:3)
dat  
dat[,1]
dat$x

dat$z <- dat$y^2
dat$name <- c("Cat", "Vic", "Osc")
dat$y<-NULL
dat

# Mergin data frames
dat1 <- data.frame(name=c("Cat", "Vic", "Osc"), age=c(9,7,4))

dat1

dat2 <- data.frame(names=c("Vic","Cat", "Osc"), gender=c("Male","Female","Male"))

dat2

dat <- merge(dat1, dat2, by.x="name", by.y="names")
dat

#exercice 1
data.frame.x <- data.frame(names=c("Gretha","Robert","John","Heather"),
                         age=c(30,18,25,70),
                         nickname=c("Quicksilver","The Man","Nifty","Starlight"))

data.frame.y <- data.frame("Person_name"=c("William","Nancy","Charlotte","Henry"),
                         age=c(15,75,32,51),
                         "pet_dog"=c("King","Whity","Captain Vom","Doggie"))

data.frame.z<-merge(data.frame.y,data.frame.x,
                    by.x=c("Person_name","age"),
                    by.y=c("names","age"),all=TRUE)

dat1 <- data.frame(name=c("Cat","Vic","Osc"),
                   age =c(9,7,4))

dat2 <- data.frame(name=c("Vic","Jon","Cat"),
                   gendee =c("male","female","female"))

data.frame.3 <- merge(dat1,dat2,all = T)


# Getting dimension and column info
df <- dat

df

names(df)

class(df$name)
class(df$age)

dim(df)
nrow(df)
ncol(df)

# Object structure
str(df)

head(airquality, 3)

tail(airquality, 3)

# The subset() function
head(airquality, 3)

datA <- airquality[airquality$Temp>80,c("Ozone","Temp")]

datA <- subset(airquality, Temp > 80, select = c(Ozone, Temp))
datB <- subset(airquality, Day == 1, select = -Temp)
datC <- subset(airquality, select = Ozone:Wind)

datD <- subset(airquality,!is.na(Solar.R))


names(iris)
levels(iris$Species)
setosa.dat <- subset(iris, Species == "Setosa" & Sepal.Lenght < median(Setosa.length), select = - Species)

# The summary() function
summary(airquality$Wind)
#setsetting with bracket
summary(airquality[,3])
summary(airquality)

summary(airquality)

# Missing values
colMeans(airquality)

is.na(NA)
mean(airquality$Ozone, na.rm = TRUE)


s <- subset(airquality, !is.na(Ozone) )
colMeans(s)

mean(airquality$Ozone, na.rm=TRUE)



# Text manipulation
txt <- c("Hello, my",
         "name is",
         "anders."
         )

grep("name", txt)

grepl("name", txt)

sub("anders", "Anders", txt)

df <- data.frame(
    person.ID = 1:3,
    fruit =
    c("apple: 3  Orange : 9 banana:2",
      " Orange:1 Apple: 3  banana: 10",
      "banana: 3 Apple: 3  Orange : 04 "
      ))

df

# Regular expressions
pattern <- ".*banana[ :]*([0-9]*).*"
#sub(pattern, "\\1", df$fruit, ignore.case=TRUE)
bananaVec <- as.numeric(sub(pattern, "\\1", df$fruit, ignore.case=TRUE))
bananaDf <- data.frame(person.ID = df$person.ID, number.of.banana = bananaVec)


#exo 8.3
my.text<-"Over the last decade, bluetongue virus have spread northwards 
from the mediterranean area. Initially this was ascribed to climate changes, 
but it has since been realized that a major contributing factor has 
been new transmitting vectors, culicoides obsoletus and culicoides pulicaris, 
which have the ability to aquire and transmit the disease. Recently, 
schmallenberg virus has emerged in northern europe, transmitted by biting midges as well."

my.lowercase<-c("bluetongue","culicoides","europe","mediterranean",
                "northern","schmallenberg")
my.uppercase<-c("Bluetongue","Culicoides","Europe","Mediterranean",
                "Northern","Schmallenberg")

my.new.text <- my.text
for(i in 1:length(my.lowercase)){
  my.new.text<-gsub(my.lowercase[i],my.uppercase[i],my.new.text)
}

my.new.text


# Date and Time object
as.Date("2016-03-10")
as.POSIXct("2016-03-10 13:53:38 CET")

conn <- odbcDriverConnect(connStr)
df <- sqlQuery(conn, "SELECT TOP 2000 * FROM bi.sentiment")
class(df$Date)

mean(df$Date)
mean(df$Date+10)

mean(as.Date(df$Date))
mean(as.Date(df$Date)+10)

old.locale<-Sys.getlocale(category = "LC_TIME")
Sys.setlocale("LC_TIME", "English")

table(weekdays(df$Date))
table(months(df$Date))

Sys.setlocale("LC_TIME",old.locale)

#lab 8
set.seed(449)
your.dates <- as.Date(sample(18000:20000,20), origin = "1960-01-01")
your.days <- c(julian(your.dates))
your.days2 <- c(julian(your.dates,origin="1960-01-01"))
your.days3 <- c(julian(your.dates,origin=as.Date("1960-01-01")))
your.days4 <- c(julian(your.dates,origin=c(1,1,1960)))

set.seed(119) 
my.days<-sample(18000:20000,20)


install.packages("chron")
# wrong 
#my.days.structure <- month.day.year(my.days,origin=as.Date("1960-01-01"))
#my.days.structure<-month.day.year(my.days)
my.days.structure<-month.day.year(my.days,origin=c(1,1,1960))


my.dates<-as.Date(my.days, origin = "1960-01-01") 
my.date.info<-data.frame(Weekday=weekdays(my.dates),my.days.structure)
#my.date.info<-cbind(Weekday=weekdays(my.dates),my.days.structure)
#my.date.info<-rbind(Weekday=weekdays(my.dates),my.days.structure)
my.date.info<-c(Weekday=weekdays(my.dates),my.days.structure)

class(my.date.info)

close(conn)

