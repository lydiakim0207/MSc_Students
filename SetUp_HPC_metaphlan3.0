#Usefil links:
#https://github.com/biobakery/MetaPhlAn/wiki/MetaPhlAn-3.0
#https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html

#Installation on own student profile


#Opening database fastq

#SBATCH --job-name=untar_myfile
#SBATCH --ntasks=15
#SBATCH --mem=2000
#SBATCH --time=6:00:00
#SBATCH --output=/user/./%j.out

tar -x /users/./mpa_v30_CHOCOPhlAn_201901.tar

echo "done"

#Building database
#follow instruction below for anaconda installation and take note of database path
#https://github.com/biobakery/MetaPhlAn/wiki/MetaPhlAn-3.0

#Processing two samples

#!/bin/bash -l

#SBATCH --job-name=processing samples
#SBATCH --ntasks=15
#SBATCH --mem=300000
#SBATCH --time=24:00:00
#SBATCH --output=/scratch/users/%u/%j.out


conda activate microbiome
module load apps/bowtie2/2.3.5.1 

DATABASE="/users/*/metaphlan_databases"
SAMP="/users/*/Genome.Assemblies"
RESULTS="/users/*/genome.results"

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"

metaphlan --very-sensitive --no-unal --input_type $SAMP/17198wA11_Sample_84.fasta -x $DATABASE/mpa_v30_CHOCOPhlAn_201901 -S $RESULTS/Sample.84.sam
metaphlan $RESULTS/Sample.84.sam --input_type sam -o $RESULTS/profiled_84.txt

metaphlan --very-sensitive --no-unal --input_type $SAMP/17198wB7_Sample_50.fasta -x $DATABASE/mpa_v30_CHOCOPhlAn_201901 -S $RESULTS/Sample.50.sam
metaphlan $RESULTS/Sample.50.sam --input_type sam -o $RESULTS/profiled_50.txt

echo "$dt"
