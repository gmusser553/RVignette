## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(AncBAMM)

## ------------------------------------------------------------------------
posteriors <- AncBAMM::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/posterior_tree_set.nex")

## ------------------------------------------------------------------------
f <- AncBAMM::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/mcmc_out.txt")
mcmcout <- read.csv(f, header = TRUE, sep = ",", stringsAsFactors = TRUE)
head(mcmcout)

## ------------------------------------------------------------------------
my_Newick_tree<-AncBAMM::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/MyNewickTreefile.tre")

## ------------------------------------------------------------------------
sevent<-AncBAMM::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/sevent_data.txt")

## ------------------------------------------------------------------------
grui.tree<-AncBAMM::read.nexus(file=posteriors) 

subsettree<-grui.tree[[42]]


## ------------------------------------------------------------------------
AncBAMM::plotTree(subsettree,type="fan",ftype="i", color=gameofthrones::got(150, option = "Targaryen2"), fsize=0.3)

## ------------------------------------------------------------------------
f <- AncBAMM::curl("https://raw.githubusercontent.com/gmusser553/ADA_Final_Project/master/ONLYGruiBodyMassData.csv")
GRUIMassData <- read.csv(f, header = TRUE, sep = ",", stringsAsFactors = TRUE)
head(GRUIMassData)

## ------------------------------------------------------------------------

meanmass<-GRUIMassData$LogMean

names(meanmass)<-GRUIMassData$`Species Name`
xxx <- na.omit(meanmass)

v <- subsettree$tip.label %in% names(xxx)
drop <- subsettree$tip.label[v==FALSE]
d2<-ape::drop.tip(subsettree, drop)

