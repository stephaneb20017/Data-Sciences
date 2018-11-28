#Reading data from a text file

mydat<-data.frame(x1=c(2,2,3,3,1,1), x2=c(.3, 1, 2.1, 2.2, .1, .2), x3=0.01*c(1,11,4,2,10,6))
mydat

#The R working directory

getwd()
setwd("c:/otherdatadir")
mydat<-read.table("data.exercise5.1.dat", skip =1,header=TRUE)
head(mydat)
# The read.table()| function 

options(deparse.cutoff=48)
args(read.table)
dat<-read.table("Data/testdat1.dat", header=TRUE, skip=5, nrow=2)
dat

dat2 <-read.table("data.exercise5.2.dat", header = T, skip = 2,nrow = 3,
                  dec = ",",sep =";")

dat<-read.table("Data/testdat2.dat", header=TRUE, na.strings=".", 
                comment.char=";", dec=",")
dat
#exo 3
read.csv2("Exercise 5.3.csv",na.strings="",skip=2)[,-1]


#Reading from more complicated files

cat(1:5+pi,'\n',file="scantest.txt")

vec<-scan("scantest.txt")
vec

cat(paste("A B C\n",paste(1:5+0.324654, collapse=" "),'\n',"How many roads\n", sep=""),file="readlinestest.txt")

vec<-readLines("readlinestest.txt")
vec
strsplit(vec[2]," ")
as.numeric(strsplit(vec[2]," ")[[1]])

#File connections

f1<-file("readlinestest.txt", open="r")
scan(f1,what="",nlines=1)
scan(f1,what=double(),nlines=1)
readLines(f1)
close(f1)


#exo 4

f1<-file("Exercise 5.4a.txt", open = "r")
my.names <- scan(f1,what = "",nlines = 1,skip =1)
my.data <- read.table(f1)
close(f1)
my.names<-paste(my.names[c(1,3,5)],my.names[c(2,4,6)])
names(my.data) <-my.names



my.data <-list()
my.names <- character(2)
f1<-file("Exercise 5.4b.txt", open ="r")
my.names[1] <- scan(f1,what = "",nlines = 1,skip = 1)
my.data[[1]] <-scan(f1,nlines = 1)
my.data[[2]] <-scan(f1,what = "",nlines =1)
my.data[[2]] <-matrix(scan(f1),nrow = 4, byrow = T)
close(f1)
names(my.data) <- my.names 
my.data


df <-read.table("grade.txt",skip =2, header = T,nrows = 12)
 
df <- read.table("grade.txt",skip = 2, header =T,nrows =12,sep = ",")
df <- read.csv("grade.txt", skip = 2,header = T, nrows = 12)


vec <-readLines("dat.txt")
vec <- strsplit(vec[2]," ")
vec <- as.numeric(vec[[1]])

f1 <- file("reading.txt", open ="r")
scan(f1,what = "",nlines = 2)


#lab
f1 <- file("Assignment 5.dat", open = "r")
my.data <- read.table(f1,skip = 4,comment.char = "%", nrows = 7)
my.data
my.data2 <- read.table(f1,skip = 3,sep = ";", dec = ",",nrows = 2)
my.data3 <- read.table(f1,skip = 5,sep = ",",na.strings ="-9999", dec = ",",nrows = 2)

my.all.data <- rbind(my.data,my.data2,my.data3)
my.all.data

