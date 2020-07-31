#ASSOCIATION or RECOMMENDATION SYSTEM

#flipkar, amzon, netflix use association rule to give suggetions to there customers, as close association is present between two or more products

#This analysis is also called as basket 

#to perform association rule in R, "arules" package is required

install.packages("arules")
library(arules)
library(datasets)
data("Groceries")
class(Groceries) #transaction dataset
str(Groceries)
LIST(Groceries)
length(Groceries)
summary(Groceries)
size(Groceries)

#lets keep only those transaction which has atleast 3 transactions in its basket
filter_transaction <- Groceries[size(Groceries)>=3]
size(filter_transaction)

#lets create a chart for most popular items
itemFrequencyPlot(Groceries,topN=20,type="absolute")

#lets build association rule on given data
#"apriori" algorith is used for association rule
#to build association rule, we need to provide threshold value for support and confidence
#result will be rules having support and confidnce value more than threshold

rules <- apriori(Groceries,parameter = list(supp=0.001 ,conf= 0.8))
summary(rules)  #total set of rules are 410

#observing the rules now
inspect(rules[1:10])

#sorting rules
rules2 <- sort(rules,decreasing = TRUE)
inspect(rules2[1:20])

#sort data for confidence
rules4 <- sort(rules3,by="confidence",decreasing = TRUE)
inspect(rules4[1:20])

#target product rules for customers
rules3 <- apriori(Groceries,parameter = list(supp=0.001, conf=0.8),appearance = list(default="lhs", rhs="whole milk"))
inspect(rules3[1:20])

rules5 <- apriori(Groceries,parameter = list(supp=0.001, conf=0.2),appearance = list(default="rhs", lhs="curd"))
inspect(rules5)

