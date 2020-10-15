####logistic regression 






mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(mydata)
summary(mydata)
sapply(mydata, sd)
xtabs(~admit + rank, data = mydata)
mydata$rank <- factor(mydata$rank)


mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")
summary(mylogit)