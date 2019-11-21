#updated code that will produce all three side by side
library(bio3d)

plot_pdb <- function(x) {
  trimmed <- trim.pdb(read.pdb(x), chain="A", elety="CA") 
  select <- trimmed$atom$b
  plotb3(select, sse=trimmed, top = FALSE, typ="l", ylab="Bfactor")
}

files = c("1AKE", "4AKE", "1E4Y")
par(mfrow=c(1,3))
lapply(files, plot_pdb)

#updated code that will produce all three on the same graph with a separate plotting function.
library(bio3d)

trim_pdb <- function(x) {
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
multi_plotb3(lapply(files, trim_pdb), n = 3, leg_names=c("no drug", "drug A", "drug B"), main_title="Protein-Drug Interactions")