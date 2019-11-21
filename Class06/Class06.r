#You loaded the library bio3d using install.packages("bio3d") already. However, when you need it, you need to load it using the library() function.
library(bio3d)

# Can you improve this analysis code?
s1 <- read.pdb("4AKE") # kinase with drug
s2 <- read.pdb("1AKE") # kinase no drug
s3 <- read.pdb("1E4Y") # kinase with drug
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s3, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")

#mycode
hc <- hclust( dist( rbind(s1.b, s2.b, s3.b) ) )
plot(hc)


library(bio3d)
plot_pdb <- function(x) {
  trim.pdb(read.pdb(x), chain="A", elety="CA") 
}
s1 <- plot_pdb("1AKE")
s2 <- plot_pdb("4AKE")
s3 <- plot_pdb("1E4Y")
plotb3(s1$atom$b, sse=s1, top = FALSE, typ="l", ylab="Bfactor")
points(s2$atom$b, typ="l", ylab="Bfactor", col="red")
points(s3$atom$b, typ="l", ylab="Bfactor", col="blue")
leg = c("no drug", "drug A", "drug B")
legend("topright", legend = leg, fill = c("black", "red", "blue"), bty = "n")
title(main = "Protein Drug Interactions")



#updated code that will produce all three side by side
library(bio3d)
plot_pdb <- function(x) {
  trimmed <- trim.pdb(read.pdb(x), chain="A", elety="CA") 
  select <- trimmed$atom$b
  plotb3(select, sse=trimmed, top = FALSE, typ="l", ylab="Bfactor")
}
pdbs = c("1AKE", "4AKE", "1E4Y")
par(mfrow=c(1,3))
lapply(pdbs, plot_pdb)


#updated code to get them all on the same graph.
library(bio3d)
plot_pdb <- function(x) {
  trimmed <- trim.pdb(read.pdb(x), chain="A", elety="CA") 
  trimmed$atom$b
}
pdbs = c("1AKE", "4AKE", "1E4Y")
s <- lapply(pdbs, plot_pdb)
plotb3(s[[1]], sse=s[[1]], top = FALSE, typ="l", ylab="Bfactor")
points(s[[2]], typ="l", ylab="Bfactor", col="red")
points(s[[3]], typ="l", ylab="Bfactor", col="blue")
leg = c("no drug", "drug A", "drug B")
legend("topright", legend = leg,fill = c("black", "red", "blue"), bty = "n")
title(main = "Protein Drug Interactions")


#updated code that will produce all three on the same graph with a separate plot function.
library(bio3d)
  plot_pdb <- function(x) {
    trimmed <- trim.pdb(read.pdb(x), chain="A", elety="CA") 
    s <- trimmed$atom$b
  }
  
  multi_plotb3 <- function(x, n, leg_names, main_title) {
    plotb3(x[[1]], sse=x[[1]], top = FALSE, typ="l", ylab="Bfactor")
    for(i in 2:n) {
      points(x[[i]], typ="l", ylab="Bfactor", col= c("black", "red", "blue", "green")[[i]])
      legend("topright", legend=leg_names, fill = c("black", "red", "blue", "green"), bty = "n")
      title(main = main_title)
    }
  }
  
files = c("1AKE", "4AKE", "1E4Y")
s <- lapply(files, plot_pdb)
multi_plotb3(s, n = 3, leg_names=c("no drug", "drug A", "drug B"), main_title="Protein-Drug Interactions")




#Simplify

library(bio3d)

plot_pdb <- function(x) {
  trimmed <- trim.pdb(read.pdb(x), chain="A", elety="CA") 
  trimmed$atom$b
}

multi_plotb3 <- function(x, n, leg_names, main_title) {
  plotb3(x[[1]], sse=x[[1]], top = FALSE, typ="l", ylab="Bfactor")
  for(i in 2:n) {
    points(x[[i]], typ="l", ylab="Bfactor", col= c("black", "red", "blue", "green")[[i]])
    legend("topright", legend=leg_names, fill = c("black", "red", "blue", "green"), bty = "n")
    title(main = main_title)
  }
}

files = c("1AKE", "4AKE", "1E4Y")
multi_plotb3(lapply(files, plot_pdb), n = 3, leg_names=c("no drug", "drug A", "drug B"), main_title="Protein-Drug Interactions")


#Can we get it to one function?

library(bio3d)

plot_pdb <- function(x, n, leg_names, main_title) {
  read_pdb <- unlist(lapply(x, read.pdb))
  trim_pdb <- unlist(lapply(read_pdb, read.pdb))
  s <- trim_pdb$atom$b
  plotb3(s[1], sse=s[1], top = FALSE, typ="l", ylab="Bfactor")
  legend("topright", legend=leg_names, fill = c("black", "red", "blue", "green"), bty = "n")
  title(main = main_title)
  for(i in 2:n) {
    points(s[i], typ="l", ylab="Bfactor", col= c("black", "red", "blue", "green")[i])
  }
}

files = c("1AKE", "4AKE", "1E4Y")
plot_pdb(x = files, n = 3, leg_names=c("no drug", "drug A", "drug B"), main_title="Protein-Drug Interactions")



#Q1. What type of object is returned from the read.pdb() function?
#A PDB coordinate file (datafra"me)


#Q2. What does the trim.pdb() function do?
#Produce a  smaller PDB object with a subset of atoms from a larger PDB object.

#Q3. What input parameter would turn off the marginal black and grey rectangles in the plots and what do they represent in this case?
#sse = secondary structure object


#Q4. What would be a better plot to compare across the different proteins?
#


#Q5. Which proteins are more similar to each other in their B-factor trends. How could you quantify this?
#
