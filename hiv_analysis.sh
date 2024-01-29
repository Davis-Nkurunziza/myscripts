#!/bin/bash
#Developed by NKURUNZIZA DAVIS NSABIYUNVA REG_NO: 2023/HD07/3376U STUD_NO: 2300703376

# Bash script for integrating bioinformatics and Geospatial Information System (GIS) for geospatial analysis of HIV outbreaks

# Step 1: Prompt for the path to the samples file 
read -p "Enter the path to the samples file: " samples_file

# Step 2: Prompt for the output directory name
read -p "Enter the name of the output directory: " output_dir_name

# Step 3: Create the output directory
output_dir="$output_dir_name"
mkdir "$output_dir"

# Step 4: Download HIV genetic data from the SRA database using SRA Toolkit
echo "Downloading HIV genetic data..."
# Replace <accessions_array> with an array of SRA accession numbers for HIV data
accessions_array=($(cat "$samples_file"))
for accession in "${accessions_array[@]}"; do
    echo "downloding fastq files"
    fastq-dump "$accession" -O "$output_dir"
done

# Step 5: Perform quality control using FastQC
echo "Performing quality control..."
fastqc "$output_dir"/*.fastq -o "$output_dir"

# Step 6: Perform read trimming and filtering using Fastp
echo "Performing read trimming and filtering..."
fastp -i "$output_dir"/*.fastq -o "$output_dir/trimmed_data.fastq"

# Step 7: Perform read alignment
echo "Performing read alignment..."
# Replace <reference> with the path to the HIV reference genome
bwa mem <reference> "$output_dir/trimmed_data.fastq" > "$output_dir/aligned_data.sam"

# Step 8: Convert SAM to BAM and sort
echo "Converting SAM to BAM and sorting..."
samtools view -bS "$output_dir/aligned_data.sam" | samtools sort -o "$output_dir/sorted_data.bam"

# Step 9: Perform variant calling using FreeBayes
echo "Performing variant calling..."
# Replace <reference> with the path to the HIV reference genome
freebayes -f <reference> "$output_dir/sorted_data.bam" > "$output_dir/variants.vcf"

# Step 10: Perform variant annotation using SNPeff
echo "Performing variant annotation..."
snpEff -v -c snpEff.config -s "$output_dir/summary.html" -noStats "$output_dir/variants.vcf" > "$output_dir/annotated_variants.vcf"


echo "HIV analysis complete! Results are stored in the $output_dir directory."

