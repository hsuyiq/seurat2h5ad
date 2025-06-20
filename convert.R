#!/usr/bin/env Rscript
# convert_no_gunzip.R

library(Seurat)
library(SeuratDisk)

# Input file (already unzipped)
rds_file <- "GSE195445_Human_obj.rds"

# Build output names
h5seurat <- sub("\\.rds$", ".h5seurat", rds_file)
h5ad     <- sub("\\.rds$", ".h5ad",     rds_file)

# 1) Create the .h5Seurat container
Convert(rds_file, dest = h5seurat, overwrite = TRUE)

# 2) Convert that into .h5ad
Convert(h5seurat, dest = h5ad, overwrite = TRUE)

cat("✅ Conversion complete — generated:", h5ad, "\n")
