#' ---
#' title: "Class 5 R Introduction"
#' author: "Shreya Sunkara"
#' ---
#' 
#Class 5 Data Visualization

#rnorm pulls x (1000 in this case) number of random data points from a normal distribution
x <- rnorm(1000)

#Some summary stats
mean(x)
sd(x)

#Summary gives you 5 big stats
summary(x)

boxplot(x)
hist(x)

#Rug shows "tassels" individual data points that histogram is summarizing
rug(x)

#Section 2 Scatterplots
#Lets read input file first

baby <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
baby

#Cex changes plot point circle size
#Pch changes plot character (shape,filled or not), diff codes
#Lwd changes line width thickness
plot(baby$Age,baby$Weight,pch=15, type="o",cex=3, ylim=c(2,10),xlab="Baby Age (months)", ylab="Baby Weight (kg)", main="Age vs. Weight")

#Have to say sep="\t" to let it know separated by tab
feat <- read.table("bimm143_05_rstats/feature_counts.txt", header = TRUE,sep="\t")


#Read.delim already does all the stuff above without having to explicitly explain each one
mouse <- read.delim("bimm143_05_rstats/feature_counts.txt")
par(mar=c(5,11,4,2))
barplot(mouse$Count, names.arg=mouse$Feature, horiz = TRUE, ylab="", main="Number of features in the mouse GRCm38 genome", las=1, xlim=c(0,80000))

#Experimenting with color, need to select each line to have all be read/run
gender <- read.delim("bimm143_05_rstats/male_female_counts.txt")
#Make rainbow colored
barplot(gender$Count, names.arg=gender$Sample, col=rainbow(nrow(gender)), las=2, ylab="Counts")
#Make males blue and females red
barplot(gender$Count, names.arg=gender$Sample, col=c("blue2","red2"), las=2, ylab="Counts")
#Import the up_down_expression.txt into an object called genes
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
#Find number of rows
nrow(genes)
#Find how many genes are up, down, or unchanging
table(genes$State)
#Set up graph
plot(genes$Condition1, genes$Condition2, col=genes$State, 
     xlab="Expression Condition 1", ylab="Expression Condition 2")
#Redraw plot with new colors
palette(c("blue","gray","red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression Condition 1", ylab="Expression Condition 2")

#Plot expresion vs gene regulation
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
nrow(meth)
plot(meth$gene.meth, meth$expression)
dcols <- densCols(meth$gene.meth, meth$expression)

#Plot changing the plot character ('pch') to a solid circle
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)

#Find the indices of genes with above 0 expresion
inds <- meth$expression > 0

#Plot just these genes
plot(meth$gene.meth[inds], meth$expression[inds])

## Make a density color vector for these genes and plot
dcols <- densCols(meth$gene.meth[inds], meth$expression[inds])

plot(meth$gene.meth[inds], meth$expression[inds], col = dcols, pch = 20)

dcols.custom <- densCols(meth$gene.meth[inds], meth$expression[inds],
                         colramp = colorRampPalette(c("blue2",
                                                      "green2",
                                                      "red2",
                                                      "yellow")) )

plot(meth$gene.meth[inds], meth$expression[inds], 
     col = dcols.custom, pch = 20)

