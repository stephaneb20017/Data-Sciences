#lab 9
my.data<-data.frame(Treatment=c(rep("A",4),rep("B",4)),
                    Stone=rep(rep(c("Small","Large"),c(2,2)),2),
                    Success=rep(c(1,0),4),
                    Count=c(81,6,192,71,234,36,55,25))

str(my.data)


#question2
#my.table <-xtabs(Treatment~Stone+Success+Count,data=my.data)
#my.table <-xtabs(Stone~Treatment+Success+Count,data=my.data)
#my.table <-xtabs(Success~Treatment+Stone+Count,data=my.data)
ftable(my.table)
#correct
my.table <-xtabs(Count~Treatment+Success+Stone,data=my.data)
ftable(my.table)

#question3
#margin.table(prop.table(my.table, 1:2),1)
#margin.table(prop.table(my.table, 1:2),2)
prop.table(margin.table(my.table, 1:2),1) # meilleur traitement B
#prop.table(margin.table(my.table, 1:2),2)


#question4 en pourcentage
Traitement <- my.table[,,2]
ftable(Traitement)

#prop.table(my.table[,,1],1)
#prop.table(my.table[,,1],2)

#correct prob table
smallA <- prop.table(my.table[,,2],1)
ftable(smallA)

#wrong
smallB <-prop.table(my.table[,,2],2)
ftable(smallB)

my.table[,,1] # large
my.table[,,2] # small


#question5 for large stone
my.table[,,1]
largeA <- prop.table(my.table[,,1],1)
ftable(largeA)

#largeB <- prop.table(my.table[,,1],2)
#ftable(largeB)

#question6 traitement A
my.table[1,,] #traitement A
my.table[2,,] #traitement B

#traitementA <- prop.table(my.table[1,,],1)
#ftable(traitementA)

traitementB <- prop.table(my.table[1,,],2)
ftable(traitementB)

#question7 traitement B
#traitementC <- prop.table(my.table[2,,],1)
#ftable(traitementC)

traitementD <- prop.table(my.table[2,,],2)
ftable(traitementD)

#question8 margin converting into freq stone and treatement
prop.table(margin.table(my.table, 1:3),1)
prop.table(margin.table(my.table, c(3,1)),1)

prop.table(margin.table(my.table, 3:1),2)
prop.table(margin.table(my.table, c(1,3)),2)
