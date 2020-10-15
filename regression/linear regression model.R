#Fitting a linear regression model


rm(list=ls())


library(olsrr)
library(ggplot2)
library(GGally)
library(pastecs)




ggplotRegression <- function (fit) {
  
  require(ggplot2)
  
  ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) + 
    geom_point(colour = "#431747", size = 1.5) +
    stat_smooth(method = "lm", col = "#ff30be" , size = 1.5) +
    labs(title = paste("Intercept =",signif(fit$coef[[1]],5 ),
                       " , Slope =",signif(fit$coef[[2]], 5),
                       " , Adj R^2 = ",signif(summary(fit)$adj.r.squared, 5)))+ 
    theme_light()+
    theme(
      plot.title = element_text( size=16, face="bold.italic"),
      axis.title.x = element_text( size=14, face="bold"),
      axis.title.y = element_text( size=14, face="bold"),
      axis.text.x = element_text(color = "grey20", size = 15, angle = 0, hjust = .5, face = "plain"),
      axis.text.y = element_text(color = "grey20", size = 12, angle = 0, hjust = 1, face = "plain")
    )
    
}










reg_dat = xxxxxxxxxxxxxxxxxxxx     #data file name
ggpairs(reg_dat)
stat.desc(reg_dat)
names(reg_dat)     # x,y   
reg<-lm(Y ~X , data = reg_dat)


ols_regress(reg)              # summary and show ANOVA table
coefficients(reg)                    #B0 and B1
head(fitted(reg))                #first 6 fitted valve of y
head(residuals(reg))              #first 6 residuals
confint(reg,level = 0.99)       # Confidence Intervals For Model Parameters






# plot
library(tidyverse)
ggplotRegression(reg)


par(mfrow = c(2, 2))  # Split the plotting panel into a 2 x 2 grid
plot(reg)