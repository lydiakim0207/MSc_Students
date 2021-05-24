#!/bin/bash -l
 

 
#SBATCH --job-name=test1_metaphlan_part1
 
#SBATCH --ntasks=8
 
#SBATCH --mem=2000
 
#SBATCH --time=6:00:00
 
 
conda activate microbiome
module load apps/bowtie2/2.3.5.1
 
DATABASE="/users/..."
SAMP="/users/..."
RESULTS="/users/..."

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"

metaphlan  $SAMP/metagenome_1.fastq,$SAMP/metagenome_2.fastq --bowtie2out $DATABASE/mpa_v30_CHOCOPhlAn_201901 --input_type fastq --nproc 4 -o $RESULTS/profiled_metagenome.txt

 
echo "$dt"
