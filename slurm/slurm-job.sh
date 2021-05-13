#!/bin/bash
#SBATCH --time=00:01:00
#SBATCH --job-name="MyJob"
#SBATCH --mem=1GB
#SBATCH -n 1

module load R/4.0.5

Rscript --vanilla "${PACKAGE_DIR}"/path/to/script.R
