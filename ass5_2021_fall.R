###### This is the file where you save your R code that produces the objects (graphs, tables) that you want to embed into 
# your assignment.  Make sure that there are no errors when you source this file before sourcing it from assignment5.Rmd file.
library("tidyverse") #we use functions from this library.
library("here")
###########################which section?
section <- 1
##########################The program
public_folder <- paste0("publicdata",section)
all_data <- paste0("cprg",section,".csv")

mydf <- read_csv(here(public_folder,all_data))%>%
  mutate(alpha=factor(treatment/2,ordered=TRUE))

