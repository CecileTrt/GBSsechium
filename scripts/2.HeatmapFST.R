#To plot a pairwise FSTs according to Nei (1987).
#Packages needed:
library(vcfR)
library(adegenet)
library(hierfstat)

#to charge folder needed
popFolder <- read.csv('../meta/eduleTareafinal_pop.txt', sep='\t', header = TRUE)
idFolder <- read.csv('../data/edule_ind.txt', header = FALSE)
vcfFolder <- read.vcfR("../data/edule_2allel_MAF5_missing20_HWE5.recode.vcf", verbose = FALSE)

#To convert in genind folder
gdFolder <- vcfR2genind(vcfFolder, return.alleles = TRUE)
gdFolder @pop <- as.factor(popFolder$Area) #this step is to define which column will be taken as a population
gdFolder  #to check if @pop was added 
gdFolder$pop  #to check the number of population, the name of population.

#To estimates pairwise FSTs according to Nei (1987)
gdFolder.fstat <- genind2hierfstat(gdFolder)
gdFolder_fst.mat <-pairwise.neifst(gdFolder.fstat)
gdFolder_fst.mat

# To plot the FST
heatmap(gdFolder_fst.mat,col=rev(heat.colors(100)), symm= TRUE, cexRow =1.1, cexCol = 0.9)

