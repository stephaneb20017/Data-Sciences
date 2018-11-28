#Writing data to a text file}

mydat<-data.frame(x1=c(2,2,3,3,1,1),
                  x2=c(0.3,1,2.1,2.2,0.1,0.2),
                  x3=c(0.01,0.11,0.04,0.02,0.1,0.06))
mydat

write.table(mydat,file="filename.dat",row.names=FALSE,col.names=FALSE,sep=", ")

write.table(mydat,file="Data/write.datatest.txt",
            row.names=FALSE,col.names=FALSE,sep=", ")
#1xo 6.1
set.seed(9007)
my.data <- data.frame(x=rnorm(10),y = rnorm(10)+5,z = rchisq(10,1))
additional.data <- data.frame(x=rnorm(3),y=rnorm(3)+5,z=rchisq(3,1))

write.table(my.data,file="Exercice 6.txt",
            row.names = F,col.names = F, sep = ", ")
write.table(additional.data,file = "Exercice 6.txt",
            row.names = F, col.names = F, append = T, sep = ", ")


#Basic writing functions

set.seed(832)
cat("Test file for cat\n",round(rnorm(5),3),"\n", 
    file="cattest.txt")

lin<-c("Count down", paste(rev(1:10), collapse="-"), 
       "Go")
writeLines(lin, con="writelinestest.txt")

#A few special ones

sink("sinktest.txt")
x<-1:5
y<-1:3
outer(x,y)
sink()

set.seed(543)
x<-1:3
y<-rpois(10, 4)
dump(c("x","y"), file="dumptest.txt")

lis<-list(x=1:5, y=3, z=c("a","b","c"))
dput(lis, file="dputtest.txt")
dget("dputtest.txt")

#Using file connections}

set.seed(713)
f2<-file("testout.txt", open="w")
cat("Header of file\n\n", file=f2)
mat<-matrix(round(rnorm(12),8), ncol=3)
write.table(mat, file=f2, row.names=FALSE, col.names=FALSE)
close(f2)

#Using append=TRUE

set.seed(484)

cat("Header of file\n\n", file="testappend.txt")
mat<-matrix(round(rnorm(12),8), ncol=3)
write.table(mat, file="testappend.txt", row.names=FALSE, 
            col.names=FALSE, append=TRUE)

#Working with binary files: Using save() and load()

x<-rnorm(3)
lis<-list(y=1:5, z="lalala", fun=function()cat("ha-ha-ha\n"))
save(x,lis, file="test1.RData")

rm(list=ls())
load(file="test1.RData")
ls()


#exo 6.2
set.seed(45)
my.data <- data.frame(x=rnorm(10),y=rnorm(10),z=rnorm(10))
write.csv2(my.data,"Exercice 6.2v2.csv")

#exo 6.3
my.data <- data.frame(a=LETTERS[1:5],b=1:5)

write.table(my.data,file="Exercice 6.3.txt", sep =";", row.names = F)

my.text<-"TITLE extra line\n2 3 5 7\n11 13 17 \nOne more line"
writeLines(my.text,con="Exercise 6.3b.txt")


#exo 6.4
set.seed(45)
my.data<-data.frame(x=rnorm(10),y=rnorm(10),z=rnorm(10))
save(my.data,file= "Exercice 6.4.RData")
rm(my.data)
load(file = "Exercice 6.4.RData")
rm(list=ls())

#quizz
#1
write.table(mtcars,file="mtcars.txt", sep = ",")
df <- read.table("mtcars.txt",header = TRUE,sep = ",")


#2
write.table(mtcars,file ="mtcars1.txt", sep = ",")
write.csv(mtcars,file ="mtcars2.txt")


#LAB
set.seed(9007)
my.data<-data.frame(x=rnorm(10),y=rnorm(10)+5,z=rchisq(10,1))
write.table(round(my.data,digits = 2),"Assignement 6a.txt",row.names = F)
write.table(format(my.data,digits = 20),"Assignment 6b.txt",row.names=FALSE)

my.data2 <- my.data * 10e5
write.table(my.data2, "Assignement 6c.txt", row.names = F)


datarRead <- read.table("Assignement 6c.txt", header = T)
my.data3 <- datarRead / 10e5

options(digits = 20)
my.data[1,1]
my.data3[1,1]

format(my.data[1,1]-my.data3[1,1],digits = 20)
