## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(AncBAMM)

## ------------------------------------------------------------------------
posteriors <- curl::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/posterior_tree_set.nex")

## ------------------------------------------------------------------------
f <- curl::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/mcmc_out.txt")
mcmcout <- read.csv(f, header = TRUE, sep = ",", stringsAsFactors = TRUE)
head(mcmcout)

## ------------------------------------------------------------------------
my_Newick_tree<-curl::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/MyNewickTreefile.tre")

## ------------------------------------------------------------------------
sevent<-curl::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/sevent_data.txt")

## ------------------------------------------------------------------------
grui.tree<-ape::read.nexus(file=posteriors) 

subsettree<-grui.tree[[42]]


## ------------------------------------------------------------------------
phytools::plotTree(subsettree,type="fan",ftype="i", color=gameofthrones::got(150, option = "Targaryen2"), fsize=0.3)

