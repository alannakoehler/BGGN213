#Section 2A

#Read the weight_chart.txt file to R. Note you have to indicate the directory and that there is a header. If you don't indicate there is a header (default is false), R will automatically name the variables as the first line.
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)

#Plot the data as a point and line graph
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5, col = "blue", ylim=c(2,10), main = "Baby weight by age", ylab = "Weight (kg)", xlab = "Age (months)")

#Section 2B

#Read the feature_count.txt file to R.This is a tab-separated table and must be read using read with sep = "/t"
#mouse <- read.table("bimm143_05_rstats/feature_counts.txt", header = TRUE, sep = "/t")

#You can also use the following code:
mouse <- read.delim("bimm143_05_rstats/feature_counts.txt")

#Plot the data as a barplot. Las = 1 sets the ylab to horiz. Las =2 sets the xlab to vertical. Par(mar) sets your margin (bottom, left, top, right).
par(mar = c(3, 15, 2, 5))
barplot(mouse$Count, horiz = TRUE, names.arg = mouse$Feature, main = "Number of features in the mouse GRCm38 genome", las = 1, xlim = c(0,80000))

#Section 3A

#Read the male_female_counts.txt file into R.
sex <- read.delim("bimm143_05_rstats/male_female_counts.txt")

#Plot the data as a barplot with rainbow(). You can use the broom icon to clean the margins set for the last plot. 
par(mar = c(6, 15, 2, 5))
barplot(sex$Count, ylab = "Counts", names.arg = sex$Sample, col = rainbow(10), las = 2 )           

#file:///Users/akoehler/Desktop/BGGN213/RStudio/Class05/Class5_worksheet.html

#Replot the data with bars separate colors for male and female.
barplot(sex$Count, ylab = "Counts", names.arg = sex$Sample, col = c("blue", "red"), las = 2) 

#Section 3B

#Read the up_down_expression.txt file into R.
exp <- read.delim("bimm143_05_rstats/up_down_expression.txt")
 
#How many genes are in this file (rows)?
nrow(exp)

#Plot so that each point is colored by State. Note default coloring from palette().
plot(exp$Condition1, exp$Condition2, col = exp$State)
levels(exp$State)
palette(c("blue", "gray", "red"))
plot(exp$Condition1, exp$Condition2, col = exp$State)

#Section 3C

#Read expression_methylation.txt into R.
meth<- read.table("bimm143_05_rstats/expression_methylation.txt", header = TRUE)
nrow(meth)

#Make a scatterplot.
plot(meth$gene.meth, meth$expression)

#Now color the scatterplot by density.
dcols <- densCols(meth$gene.meth, meth$expression)
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)

# Find the indices of genes with above 0 expresion
inds <- meth$expression > 0

# Plot just these genes
plot(meth$gene.meth[inds], meth$expression[inds])

# Make a desnisty color vector for these genes and plot
dcols <- densCols(meth$gene.meth[inds], meth$expression[inds])
plot(meth$gene.meth[inds], meth$expression[inds], col = dcols, pch = 20)

#Change the colramp to go from blue, green, red, yellow.
dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )
plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)
