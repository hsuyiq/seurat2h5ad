#!/usr/bin/env Rscript

library(Seurat)
library(SeuratDisk)
library(R.utils)

# 1) Download directly from GEO
url      <- "ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE195nnn/GSE195445/suppl/GSE195445_Human_obj.rds.gz"
dest_gz  <- "GSE195445_Human_obj.rds.gz"
if (!file.exists(dest_gz)) {
  download.file(url, destfile = dest_gz, mode = "wb")
}

# 2) Unzip
gunzip(dest_gz, overwrite = TRUE)
rds_file <- sub("\\.gz$", "", dest_gz)

# 3) Read & convert
seurat_obj <- readRDS(rds_file)

h5seurat <- sub("\\.rds$", ".h5seurat", rds_file)
SaveH5Seurat(seurat_obj, filename = h5seurat, overwrite = TRUE)

h5ad <- sub("\\.rds$", ".h5ad", rds_file)
Convert(h5seurat, dest = h5ad, overwrite = TRUE)

cat("✅ All done — here’s your AnnData:", h5ad, "\n")
