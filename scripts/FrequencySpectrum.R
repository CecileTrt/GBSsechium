#Change language settings in English (to get error/comment messages in English).
Sys.setenv(LANG = "en") 

#Packages needed:
library(ggplot2)
library(tidyr)
library(dplyr)
library(gridExtra)

#Add the name of the folder ".frq"
ParamFolder <- "BE50_2allel_MAF5_missing20_HWE5_freq"
MyFolder <- paste0(ParamFolder,".frq")

#To charge the folder with: read.delim()
#skip=1, to skip the first line of the folder
#header = FALSE, to remove the header of the folder,
#col.names = c(…), to add new column names manually.
folder.frq <-read.delim(MyFolder,
                    skip=1,
                    header=FALSE,
                    col.names = c("CHROM",	"POS",	"N_ALLELES",	"N_CHR", "ALLE1", "ALLE2"))

#Use “separate” to split a column into two,
#col=,to select the column to split,
#into=c(), to create the new columns with new names,
#sep=, to select the element of separation.
#mutate(), to convert character values as a numeric.
#%>%, to connect multiple functions into a single command.
folder.frq2 <- separate(data = folder.frq,
                         col=ALLE1,
                         into=c("ALLE1", "ALLE1.frq"),
                         sep= ":") %>%
  separate(col=ALLE2,
           into=c("ALLE2", "ALLE2.frq"),
           sep= ":") %>%
  mutate(., ALLE1.frq= as.numeric(ALLE1.frq)) %>%
  mutate(., ALLE2.frq= as.numeric(ALLE2.frq))

##To graph the minor allele (number 2)
g1 <-ggplot(folder.frq2, aes(x=ALLE2.frq)) +
  geom_histogram(aes(y=(..count..)/sum(..count..))) +
  xlab ("Minor allele frequency") + ylab("Percentage") +  
  theme_bw()

##To graph the major allele (number 1)
#g2 <- ggplot(folder.frq2, aes(x=ALLE1.frq)) +
  geom_histogram(aes(y=(..count..)/sum(..count..))) +
  xlab ("Major allele frequency") + ylab("Percentage") +  
  theme_bw()

#To put the 2 plots together 
#g3 <- grid.arrange(g1, g2, nrow = 1)

#To save the plot
ggsave(paste0("../figures/", ParamFolder, "_FSplot.tiff"), plot = g1,
       width = 10, height = 7, dpi = 300) 


