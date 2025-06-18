library(Seurat)
library(SeuratDisk)
library(R.utils)

url <- "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE195nnn/GSE195445/suppl/GSE195445%5FHuman%5Fobj.rds.gz"
download.file(url, destfile = "GSE195445_Human_obj.rds.gz")

gunzip("GSE195445_Human_obj.rds.gz", remove= FALSE)

Convert("GSE195445_Human_obj.rds", dest= "GSE195445_Human_obj.h5ad", overwrite= TRUE)
