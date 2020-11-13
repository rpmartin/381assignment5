###### This is the file where you save your R code that produces the objects (graphs, tables) that you want to embed into 
# your assignment.  Make sure that there are no errors when you source this file before sourcing it from assignment3.Rmd file.

rm(list=ls()) #makes sure that your work environment is clean.
library("tidyverse") #we use functions from this library.
library("gplots") # may need to install.packages("gplots") at the console prompt.
library("viridis") # may need to install.packages("viridis") at the console prompt.
slash <- ifelse(.Platform$OS.type=="unix", "/", "\\") #The eternal directory battle: Windows vs. *nix
####################which section?
section <- 1
#########################
mydf <- read_csv(paste("publicdata",section,slash,"cprg",section,".csv",sep=""))%>% # reads in the data for your section.
  group_by(oneid)%>%
  mutate(mean_choice=mean(choice),
         all_rounds=n()>19)%>%
  arrange(rematching,mean_choice)

#################heatmap requires data in wide format.
widedf <- mydf%>%
  filter(all_rounds==TRUE)%>%
  pivot_wider(id_cols=c(rematching,oneid,mean_choice),names_from=round,values_from=choice)%>%
  as.data.frame()

rownames(widedf) <- paste(widedf$rematching,widedf$oneid,sep=".")
mymat <- widedf%>%select(-rematching,-oneid,-mean_choice)%>%
  as.matrix()%>%
  t()




