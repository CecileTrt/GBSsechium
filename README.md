# GBSsechium
**Evolución Molecular Adaptativa - Final Project**

*The aim of this final project is to make from our own subject, analysis associated with the topics that have been seen in class.*

## Table of contents
- [data](#data)
- [figures](#figures)
- [meta](#meta)
- [scrpits](#scripts)

## data
Data needed to run the script ["2.HeatmapFST.R"](#scripts):

- "edule_ind.txt" contains the individuals of the specie *Sechium edule spp. edule* selected for this work. They are indentificated by their plate number (A01, A02, etc.)

- "edule_2allel_MAF5_missing20_HWE5.recode.vcf" is a output made by VCFTools. TO create it, it was used the vcf file made by the final step of Ipyrad, and the following parameters was applied: "--min-alleles 2" "--max-alleles 2" "--max-missing 0.8" "--maf 0.05" "--hwe 0.05"

Data needed to run the script ["3.FrequencySpectrum"](#scripts):

To be run by R, it should be used a ".frq" file, an output made by vcftools. The following command was used to make it: --vcf VCFfile.vcf --max-missing 1.0 --freq --out NewFRQfile

- "Comitan.frq" contains the individuals from the area Comitan (G02, F03, G03, B04, B05, C07, G07).

 - "Cuicatlan.frq" contains the individuals from the area Cuicatlan (E02, C03, C04, E05, B06, C08).

 - "EDOCUE.frq" contains the individuals from the area Estado de Mexico/Cuernavaca (E01, H02, B03, D03, A05, F05, A06, E06, B07, D08).

- "SanCristobal.frq" contains the individuals from the area San Cristobal de las Casas (F01, B02, A03, H03, A04, E04, F07, A08).

- "Tuxtla.frq" contains the individuals from the area Tuxtla Gutiérrez (B01, F02, E03, D04, F04, H05, F06).

- "Xalapa.frq" contains the individuals from the area Xalapa (G01, A02, C02, C05, D05, C06, E08, F08).

- "edule_edule.frq" contains all the individuals from the specie *Sechium edule spp. edule* (cf. edule_ind.txt).


## figures

Figures of the sample locations, an heatmap pairwise Fst for the different areas and allele spectrum frequency barplots generated for each area [from R](#scripts).

## meta
Meta data needed to run the script ["1.MapTareaFinal.R"](#scripts)

- "eduleTareafinal_pop.txt" contains various information about each sample such as the size of the fruit, the aspect, the color, the altitud, the latitud and longitud in decimal format, information related to the point of collection (state, region, area to define, locality).

## scripts
The following script can be run in any order. The numbering refers to the order of the scripts used in the file "resumen.Rmd"

- "1.MapTareaFinal.R" is to plot the location of each sample, the different areas are differentiated by different colors. To make it, it will be needed ["eduleTareafinal_pop.txt"](#meta) and "gadm36_MEX_1_sp.rds" present in this same folder. 

- "2.HeatmapFST.R" is to plot a pairwise FSTs according to Nei (1987). To make it, it will be needed ["edule_ind.txt", "edule_2allel_MAF5_missing20_HWE5.recode.vcf"](#data) in the data folder and ["eduleTareafinal_pop.txt"](#meta) in the meta folder. 

- "3.FrequencySpectrum.R" is to graph the minor allele frequency spectrum, it can be used any of the [".frq"](#data) files of the data folder to make it.

- "Resumen.Rmd" is a summary of this work. Available in different version: HTLM, Document Microsoft Word and PDF. 

- "gadm36_MEX_1_sp.rds": file needed to plot the "1.MapTareaFinal.R" 
