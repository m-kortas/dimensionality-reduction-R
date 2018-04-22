library(gridExtra)
library(corrplot)
library(ggplot2)

rectask <- read.csv("/Users/ja/R-Projects/recruitment_project/train.csv", header = T, row.names = 1, sep=",", dec="." )

dim(rectask) #rekordy i kolumny
sum(is.na(rectask))  #ile pustych

graphlist <- list() 
for (i in names(rectask)) {
  graphlist[[i]] <- ggplot(rectask, aes_string(x=i)) + geom_histogram(fill = "SteelBlue") + labs(y = "")
}
do.call("grid.arrange", c(graphlist, ncol = 4))     #wykresy, rozkład

summary(rectask)

corrplot(cor(rectask), method = "number", type = "upper", numer.cex = 0.6) #korelacje 

rectask2 <- subset(rectask, select=-c(feat7, feat12, feat17, feat13, feat20))
