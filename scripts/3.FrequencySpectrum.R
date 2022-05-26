#To graph the minor allele frequency spectrum

#Packages needed:
library(ggplot2)
library(tidyr)
library(dplyr)
library(gridExtra)

#Add the name of the folder ".frq"
ParamFolderA <- "Comitan"
MyFolderA <- paste0("../data/",ParamFolderA,".frq")

ParamFolderB <- "EDOCUE"
MyFolderB <- paste0("../data/",ParamFolderB,".frq")


#To charge the folder with: read.delim()
#skip=1, to skip the first line of the folder
#header = FALSE, to remove the header of the folder,
#col.names = c(…), to add new column names manually.
folder.frqA <-read.delim(MyFolderA,
                    skip=1,
                    header=FALSE,
                    col.names = c("CHROM",	"POS",	"N_ALLELES",	"N_CHR", "ALLE1", "ALLE2"))

folder.frqB <-read.delim(MyFolderB,
                         skip=1,
                         header=FALSE,
                         col.names = c("CHROM",	"POS",	"N_ALLELES",	"N_CHR", "ALLE1", "ALLE2"))

#Use “separate” to split a column into two,
#col=,to select the column to split,
#into=c(), to create the new columns with new names,
#sep=, to select the element of separation.
#mutate(), to convert character values as a numeric.
#%>%, to connect multiple functions into a single command.
folder.frqA2 <- separate(data = folder.frqA,
                         col=ALLE1,
                         into=c("ALLE1", "ALLE1.frq"),
                         sep= ":") %>%
  separate(col=ALLE2,
           into=c("ALLE2", "ALLE2.frq"),
           sep= ":") %>%
  mutate(., ALLE1.frq= as.numeric(ALLE1.frq)) %>%
  mutate(., ALLE2.frq= as.numeric(ALLE2.frq))

folder.frqB2 <- separate(data = folder.frqB,
                        col=ALLE1,
                        into=c("ALLE1", "ALLE1.frq"),
                        sep= ":") %>%
  separate(col=ALLE2,
           into=c("ALLE2", "ALLE2.frq"),
           sep= ":") %>%
  mutate(., ALLE1.frq= as.numeric(ALLE1.frq)) %>%
  mutate(., ALLE2.frq= as.numeric(ALLE2.frq))

##To graph the minor allele (number 2)
g1 <-ggplot(folder.frqA2, aes(x=ALLE2.frq)) +
  geom_histogram(aes(y=(..count..)/sum(..count..)), bins = 15) + #to adjust the width of the barplot 
  labs(title = ParamFolderA, x="Minor allele frequency", y="Percentage") +
  theme_bw()

g2 <-ggplot(folder.frqB2, aes(x=ALLE2.frq)) +
  geom_histogram(aes(y=(..count..)/sum(..count..)), bins = 21) +
  labs(title = ParamFolderB, x="Minor allele frequency", y="Percentage") +
  theme_bw()

g3 <- grid.arrange(g1, g2, nrow = 1)

#To save the plot
#ggsave(paste0("../figures/", ParamFolderA, "_FSplot.tiff"), plot = g1,
      #width = 6, height = 4, dpi = 300) 


