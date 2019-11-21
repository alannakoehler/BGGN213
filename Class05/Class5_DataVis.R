#Class 5 Data Visualization

#press Cmmd + Return to send highlighted text to the R console

x <- rnorm(1000)

#How many things are in x?
length(x)

#Summary statistics (min, 1st quartile, median, mean, 3rd quartile, max)
summary(x)
mean(x)
sd(x)

boxplot(x)

#Histograms
hist(x)
rug(x)
hist(x, breaks =30)
