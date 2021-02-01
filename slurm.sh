#!/bin/bash

# here is a comment
#SBATCH --time=0:01:00
#SBATCH --mem=1M

#SBATCH -N 1
#SBATCH -c 1
#SBATCH -J myJob

#SBATCH -o myJob-%j.out
#SBATCH -e myJob-%j.err

echo "hello $USER."